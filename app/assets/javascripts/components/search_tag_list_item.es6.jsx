class SearchTagListItem extends React.Component {
  render () {
    return (
      <li className="search-tag-list-item">
        <a href={this.props.tag.url}>
          <i className="fas fa-tag" />
          <span dangerouslySetInnerHTML={{ __html: this.props.tag.name }} />
        </a>
      </li>
    );
  }
}

