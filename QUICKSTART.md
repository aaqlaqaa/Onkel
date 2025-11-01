# Quick Start Guide

## Prerequisites

You need **Godot Engine 4.2** or later installed on your system.

Download from: https://godotengine.org/download

## Opening the Project

1. Launch Godot Engine
2. Click "Import" on the project manager
3. Navigate to this folder (`/vercel/sandbox`)
4. Select the `project.godot` file
5. Click "Import & Edit"

## Running the Game

Once the project is open in Godot:

1. Press **F5** (or click the Play button in the top-right)
2. The game will launch in a new window

## Playing the Game

### Objective
Carry the ball to your opponent's goal to score!

### Controls

**Player 1 (Blue - Left Side)**
- A: Move Left
- D: Move Right  
- SPACE: Jump

**Player 2 (Orange - Right Side)**
- LEFT ARROW: Move Left
- RIGHT ARROW: Move Right
- RIGHT SHIFT: Jump

### Rules

1. Walk into the ball to pick it up
2. The ball will follow you above your head
3. Navigate platforms to reach the opponent's goal
4. Touch an opponent who has the ball to tackle them (they drop the ball)
5. Enter the opponent's goal zone while holding the ball to score
6. First player to score the most goals wins!

## Troubleshooting

### Game won't run
- Make sure you're using Godot 4.2 or later (not Godot 3.x)
- Check that all files are present in the project folder

### Controls not working
- Make sure the game window has focus
- Check that you're using the correct keys for your player

### Players falling through floor
- This shouldn't happen, but if it does, restart the game
- Check that the collision layers are properly set

## Customization

Want to modify the game? Here are some easy tweaks:

### Change Player Speed
Edit `scripts/Player.gd`, line 6:
```gdscript
const SPEED = 300.0  # Increase for faster movement
```

### Change Jump Height
Edit `scripts/Player.gd`, line 7:
```gdscript
const JUMP_VELOCITY = -500.0  # More negative = higher jump
```

### Change Player Colors
Edit `scenes/Main.tscn`, find the Player nodes and modify the `player_color` property

### Add More Platforms
Open `scenes/Main.tscn` in the Godot editor and duplicate existing platform nodes

## Project Structure

```
/vercel/sandbox/
├── project.godot       # Main configuration
├── scenes/            # All game scenes
│   ├── Main.tscn     # Main game level
│   ├── Player.tscn   # Player character
│   ├── Ball.tscn     # Ball object
│   └── Goal.tscn     # Goal zones
└── scripts/          # Game logic
    ├── Main.gd       # Game state
    ├── Player.gd     # Player controls
    ├── Ball.gd       # Ball behavior
    ├── Goal.gd       # Scoring
    └── HUD.gd        # UI display
```

## Next Steps

- Play a few rounds to get familiar with the mechanics
- Try different strategies (defensive vs aggressive)
- Experiment with the level design in the Godot editor
- Add your own features (power-ups, new levels, etc.)

Enjoy the game! 🎮
