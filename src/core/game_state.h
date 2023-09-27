#ifndef GAME_STATE_H
#define GAME_STATE_H

struct game_state;
struct game_state_manager;

typedef void (*update_fn)(struct game_state *state, float delta_time);
typedef void (*render_fn)(struct game_state *state, float delta_time);

struct game_state
{
    update_fn update;
    render_fn render;
};

struct game_state *game_state_create(update_fn update, render_fn render);
struct game_state game_state_init(update_fn update, render_fn render);
void game_state_destroy(struct game_state *state);

struct game_state_manager
{
    struct game_state *current_state;
};

struct game_state_manager *game_state_manager_create();
void game_state_manager_destroy(struct game_state_manager *manager);
void game_state_manager_change_current_state(struct game_state_manager *manager, struct game_state *state);
void game_state_manager_update(struct game_state_manager *manager, float delta_time);
void game_state_manager_render(struct game_state_manager *manager, float delta_time);

#endif
