class UserNameWithStatus extends React.Component {


    displayStatus() {
        if (this.props.user.value === true) {
            return (
                  <Img src="verified.svg" style={this.cssStyles()} data-toggle={'tooltip'} data-placement={'right'} title={'Verifierad medlem'} />

            )
        }
    }

    render() {
        return (
            <span>
                {this.props.user.username } { this.displayStatus()}
            </span>
        )
    }

    cssStyles() {
        return {
            display: 'inline-block',
            height: '20px',
            width: '20px',
        };

    }



}
