var draftees = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  identify: function(obj) { return obj.name; },
  remote: "../v1/draftees"
})

$("#search-draftee").typeahead({
  highlight: true,
  minLength: 1
},{
  name: "draftees",
  display: "name",
  source: draftees,
})
.on("typeahead:selected", function(env, suggestion){
  window.location.href = "/draftees/" + suggestion.id;
});
