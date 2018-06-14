%%==============================================================================
%% Application Callback Module
%%==============================================================================
-module(erlang_ls_app).

%%==============================================================================
%% Behaviours
%%==============================================================================
-behaviour(application).

%%==============================================================================
%% Exports
%%==============================================================================

%% Application Callbacks
-export([ start/2
        , stop/1
        ]).

%%==============================================================================
%% Defines
%%==============================================================================
-define(DEFAULT_PORT, 9000).

%%==============================================================================
%% Application Callbacks
%%==============================================================================
-spec start(normal, any()) -> {ok, pid()}.
start(_StartType, _StartArgs) ->
  {ok, _} = ranch:start_listener( erlang_ls
                                , ranch_tcp
                                , [{port, ?DEFAULT_PORT}]
                                , erlang_ls_protocol
                                , []
                                ),
  erlang_ls_sup:start_link().

-spec stop(any()) -> ok.
stop(_State) ->
  ok.