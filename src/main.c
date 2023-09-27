#include "raylib/raylib.h"
#include "raylib/raymath.h"
#include "core/game_state.h"

#define SCREEN_WIDTH 800
#define SCREEN_HEIGHT 600

void update(struct game_state *state, float delta_time)
{
}

void render(struct game_state *state, float delta_time)
{
    DrawRectangle(10, 10, 10, 10, RED);
}

int main()
{
    InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Space Shooter");
    SetTargetFPS(60);

    struct game_state_manager *manager = game_state_manager_create();
    struct game_state *state = game_state_create(update, render);
    game_state_manager_change_current_state(manager, state);

    while (!WindowShouldClose())
    {
        float deltaTime = GetFrameTime();

        game_state_manager_update(manager, deltaTime);

        BeginDrawing();
        ClearBackground(BLACK);

        game_state_manager_render(manager, deltaTime);

        EndDrawing();
    }

    game_state_manager_destroy(manager);
    game_state_destroy(state);

    CloseWindow();

    return 0;
}
