# frozen_string_literal: true

module SearchablePost
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model

    # Sync up Elasticsearch with PostgreSQL.
    after_commit :index_document, on: %i[create update]
    after_commit :delete_document, on: [:destroy]

    settings INDEX_OPTIONS do
      mappings dynamic: 'false' do
        indexes :title, analyzer: 'autocomplete', type: :text
        indexes :body, type: :text, analyzer: 'swedish'
        indexes :published_at, type: :date
        indexes :slug, type: :text, analyzer: :keyword
        indexes :tags do
          indexes :name, type: :text, analyzer: 'swedish'
        end
        indexes :user do
          indexes :username, type: :text, analyzer: 'swedish'
          indexes :avatar_url, type: :text
        end
      end
    end

    def self.search(term)
      __elasticsearch__.search(
        query: {
          multi_match: {
            query: term,
            fields: %w[title^10 body user.username tags.name^10]
          }
        }
      )
    end
  end

  def as_indexed_json(_options = {})
    as_json(
      only: %i[title body published_at slug],
      include: {
        user: { methods: [:avatar_url], only: %i[username avatar_url] },
        tags: { only: :name }
      }
    )
  end

  def index_document
    ElasticsearchIndexJob.perform_later('index', 'Post', id) if published?
  end

  def delete_document
    ElasticsearchIndexJob.perform_later('delete', 'Post', id) if published?
  end

  INDEX_OPTIONS =
    { number_of_shards: 1, analysis: {
      filter: {
        'autocomplete_filter' => {
          type: 'edge_ngram',
          min_gram: 1,
          max_gram: 20
        }
      },
      analyzer: {
        'autocomplete' => {
          type: 'custom',
          tokenizer: 'standard',
          filter: %w[
            lowercase
            autocomplete_filter
          ]
        }
      }
    } }.freeze
end
