-module(code_navigation).

-behaviour(behaviour_a).

-export([ function_a/0 ]).

%% behaviour_a callbacks
-export([ callback_a/0 ]).

-include("code_navigation.hrl").
-include_lib("code_navigation/include/code_navigation.hrl").

-record(record_a, {field_a, field_b}).

-define(MACRO_A, macro_a).

function_a() ->
  function_b(),
  #record_a{}.

function_b() ->
  ?MACRO_A.

callback_a() ->
  ok.

function_c() ->
  code_navigation_extra:do(test),
  length([1, 2, 3]).