#include <stdlib.h>
#include "game_state.h"

struct game_state *game_state_create(update_fn update, render_fn render)
{
    struct game_state *state = malloc(sizeof(struct game_state));
    state->update = update;
    state->render = render;
    return state;
}

void game_state_destroy(struct game_state *state)
{
    free(state);
}

struct game_state_manager *game_state_manager_create()
{
    struct game_state_manager *manager = malloc(sizeof(struct game_state_manager));
    return manager;
}

void game_state_manager_destroy(struct game_state_manager *manager)
{
    free(manager);
}

void game_state_manager_change_current_state(struct game_state_manager *manager, struct game_state *state)
{
    manager->current_state = state;
}

void game_state_manager_update(struct game_state_manager *manager, float delta_time)
{
    manager->current_state->update(delta_time);
}

void game_state_manager_render(struct game_state_manager *manager, float delta_time)
{
    manager->current_state->render(delta_time);
}
