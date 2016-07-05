var Content = React.createClass({
  render: function() {
    return (
      <div>
        <h1 className="name">{ this.props.name }</h1>
        <Container aggregate={ this.props.aggregate } />
      </div>
    );
  }
});

var Container = React.createClass({
  componentDidMount: function() {
    // twttr.ready(function(twttr) {
    //   twttr.widgets.load();
    // });
  },

  render: function() {
    var tweet = function(obj) {
      return(
        <div className="tweet" id= { obj.t_id }></div>
      )
    };

    var bing = function(obj) {
      return(
        <a className="bingContainer" href={ obj.url } target="_blank" >
          <div className="bing">
            <div className="bingHead">
              <img src={ obj.thumbnail } />
              <h3 className="bingTitle">{ obj.title }</h3>
            </div>
            <p>{ obj.description }</p>
          </div>
        </a>
      )
    };

    var display_tweets_and_bings = this.props.aggregate.map(function(media) {
      if (media.title) {
        return bing(media);
      } else {
        return tweet(media);
      }
    });

    return (
      <div className="container">
        { display_tweets_and_bings }
      </div>
    )
  }
});
