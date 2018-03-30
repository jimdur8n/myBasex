module namespace c = 'http://www.library.vanderbilt.edu/basex';

import module namespace m = 'http://www.library.vanderbilt.edu/basex/model' at 'model.xqm';
import module namespace v = 'http://www.library.vanderbilt.edu/basex/view' at 'view.xqm';

declare
  %rest:path("{$error}")
  function c:error($error) {
    <rest:response>
    <http:response status="404" message="I was not found.">
      <http:header name="Content-Language" value="en"/>
      <http:header name="Content-Type" value="text/html; charset=utf-8"/>
    </http:response>
  </rest:response>,
  <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <title>Error 404</title>
        </head>
        <body>
            <h1>Error 404</h1>
            <p>Youre at the wrong page!</p>
        </body>
  </html>
};


declare
  %rest:path("hello/{$who}")
  %rest:GET
  function c:say-hello($who) {
  <response>
    <title>Hello { $who }!</title>
  </response>
};

declare
  %rest:path("hello")
  %rest:GET
  function c:say-hello() {
  <response>
     {m:say-hello()}
  </response>
};

declare
  %rest:path("list")
  %rest:GET
  function c:list-names() {
    m:list-names() => v:list()
  };

declare
  %rest:path("/")
  %rest:GET
  function c:front-page() {
  <response>
    <title>Welcome to the front page!</title>
  </response>
};

declare
  %rest:path("about")
  %rest:GET
  function c:about() {
  <response>
    <title>Welcome to the About page!</title>
  </response>
};

declare
  %rest:path("post/{$post}")
  %rest:GET
  function c:post($post) {
  <response>
    <title>Here is the post about {$post}!</title>
  </response>
};

declare
  %rest:path("titles")
  %rest:GET
  function c:title() {
  m:list-titles(0) => v:list()

};
declare
  %rest:path("titles/{$post}")
  %rest:GET
  function c:title($post) {
  m:list-titles($post) => v:list()

};
