class SearchUserListItem extends React.Component {
    render() {
        return (
            <li>
                <a href={this.props.user.url}>
                    <img width="35" className="avatar-image" src={this.props.user.avatar_url}/>
                    <UserNameWithStatus
                        user={{
                            username: this.props.user.username,
                            value: this.props.user.isVerifiedMember
                        }}/>
                    <span dangerouslySetInnerHTML={{__html: this.props.user.username}}/>
                    <span dangerouslySetInnerHTML={{__html: this.props.user.isEditor}}/>
                </a>
            </li>
        );
    }
}

