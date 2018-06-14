%%==============================================================================
%% Top Level Supervisor
%%==============================================================================
-module(erlang_ls_sup).

%%==============================================================================
%% Behaviours
%%==============================================================================
-behaviour(supervisor).

%%==============================================================================
%% Exports
%%==============================================================================

%% API
-export([ start_link/0 ]).

%% Supervisor Callbacks
-export([ init/1 ]).

%%==============================================================================
%% Defines
%%==============================================================================
-define(SERVER, ?MODULE).

%%==============================================================================
%% API
%%==============================================================================
-spec start_link() -> {ok, pid()}.
start_link() ->
  supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%==============================================================================
%% Supervisor callbacks
%%==============================================================================
-spec init([]) -> {ok, {supervisor:sup_flags(), supervisor:child_spec()}}.
init([]) ->
  {ok, { {one_for_all, 0, 1}, []} }.