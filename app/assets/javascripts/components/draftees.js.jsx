var Content = React.createClass({
  render: function() {
    return (
      <div>
        <h1 className="name">{ this.props.name }</h1>
        <Container tweets={ this.props.tweets } bings={ this.props.bings } />
      </div>
    );
  }
});

var Container = React.createClass({
  componentDidMount: function() {
    // Render tweets
    twttr.ready(function(twttr) {
      var tweets = document.getElementsByClassName("tweet");
      for (var i = 0; i < tweets.length; i++) {
        twttr.widgets.createTweet(
          tweets[i].id,
          tweets[i],
          {
            conversation: "none",
            width: "auto"
          }
        );
      }
    });
  },

  render: function() {
    var tweets = this.props.tweets.map(function(tweet) {
      return (
        <div className="tweet" id={ tweet.t_id }></div>
      );
    });

    var bings = this.props.bings.map(function(bing) {
      return (
        <a className="bingContainer" href={ bing.url } target="_blank" >
          <div className="bing">
            <div className="bingHead">
              <img src={ bing.thumbnail } />
              <h3 className="bingTitle">{ bing.title }</h3>
            </div>
            <p>{ bing.description }</p>
          </div>
        </a>
      )
    });

    return (
      <div className="container">
        { tweets }
        { bings }
      </div>
    )
  }
});
