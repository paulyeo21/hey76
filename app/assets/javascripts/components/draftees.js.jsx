var Content = React.createClass({
  render: function() {
    return (
      <div>
        <h1 className="name">{ this.props.name }</h1>
        <PostsContainer posts={ this.props.posts } />
      </div>
    );
  }
});

var PostsContainer = React.createClass({
  render: function() {
    var posts = this.props.posts.map(function(post) {
      return (
        <p>{ post.content_id }</p>
      );
    });

    return (
      <div className="postsContainer">
        { posts }
      </div>
    )
  }
});
