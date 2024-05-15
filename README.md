# Project Title

Name:
- Daniel Mendes
- Ho Chung
- Keith Railey Rumbaua

Student Number:
- C20489272
- C20348256
- C20463336

Class Group: TU858

# Description
This project is a simple flocking simulation game, where the light bugs will separate when they get too close, but try to get close to each other when they meet other light bugs for the first time, and they will move together while facing the same direction.

## Video:

[![YouTube](http://img.youtube.com/vi/J2kHSSFA4NU/0.jpg)](https://www.youtube.com/watch?v=J2kHSSFA4NU)

## Google Drive (References):
https://drive.google.com/drive/folders/1oUlCEtrgKMn2k3R5RPPJNN846DZGdXq-?usp=sharing

## Screenshots
![A screenshot](images/screenshot.png)

# Instructions
1. Run the project in Godot Engine
2. Press the keys W, A, S, D to move around the simulation environment
3. Press the space bar to jump
4. Use the mouse to change the camera angle and look around the simulation environment
5. Enjoy the simulation!

# How it works
To perform the flocking simulation, we need three main behaviors, alignment, cohesion, separation

Alignment: This behavior is used to make the entities face the same direction

- First, we get all of the light bug units' velocities
- Second, we get the average of the velocity and multiply it with the MAX speed. To prevent it from going faster and faster, it is subtracted from their orignal velocity to reset their speed

Cohesion: This behavior will make the entities go slower to get closer together
- First, we get all the positions of the light bugs
- Second, we find the center position of the light bugs and normalize this result to get the direction

Separation: This behavior is used to make a light bug try to move away from other light bugs
- We get the distance between the light bug itself and other light bugs
- Finally, we get the average of the separation and normalize this result to get the velocity

At the end, we add these 3 results with the weight to get the final velocity

# List of classes/assets

| Class/asset | Source |
|-----------|-----------|
| MyClass.cs | Self written |
| MyClass1.cs | Modified from [reference]() |
| MyClass2.cs | From [reference]() |

Each team member or individual needs to write a paragraph or two explaining what they contributed to the project

- What they did
- What they are most proud of
- What they learned