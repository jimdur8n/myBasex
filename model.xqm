module namespace m = 'http://www.library.vanderbilt.edu/basex/model';

declare namespace person = "http://www.orcid.org/ns/person";
declare namespace dets = "http://www.orcid.org/ns/personal-details";



declare function m:list-names() as element(person)*
{

for $person in fn:collection("orcid")//person:name
order by $person/dets:family-name
return <person>{(fn:string-join($person//dets:family-name),",",($person//dets:given-names/text()))}</person>

};

declare function m:say-hello()
{
  <hello/>
};

declare function m:list-titles($start) as element(title)*
{

for $title in fn:subsequence(fn:collection("tvn13-17")//record, $start, 10)
return <title>{$title/Title/text()}</title>

};
