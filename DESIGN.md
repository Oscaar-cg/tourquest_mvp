# SnapQuest – Design Document

This document explains how our SnapQuest application is organized and the main design choices we made. The goal of the project was to build a simple MVP that meet the requirements.

## 1. Overall Architecture
SnapQuest is built with Flutter. We kept the structure simple so the app is easy to understand and maintain. The project is divided into few parts:

- a model that represents each challenge
- the UI pages (Home, Challenge List, Details, Complete, Progress)
- a small local storage system to save XP
- basic logic to update XP when a challenge is completed

We did not add any backend and login system because of deadline.

## 2. Main Components

### Challenge Model
The model includes the title, description, difficulty, and XP reward.  
The challenges are predefined in the app, so we store them in memory.

### Local Storage (Hive)
Hive is used to save the user's XP and the number of challenges completed.  
We chose Hive because it is simple, works well on mobile, and does not require a backend and fits the timeline of the project.

### UI Pages
Each page focuses on a single part of the app:

- **HomePage:** shows the user's XP and navigation buttons
- **ChallengeListPage:** shows all challenges
- **ChallengeDetailPage:** shows details about a selected challenge
- **CompleteChallengePage:** updates the XP and confirms the completion
- **ProgressPage:** shows how many challenges were completed

The structure is simple, allowing users to navigate easily.

## 3. Design Decisions
We chose Flutter because it is fast to develop with, works on Android and iOS.  
We kept everything stored locally to avoid complexity and to stay within the project timeline.

Features like camera validation, GPS checks, user accounts, and maps were not included because they would take more time.

## 4. Testing
We tested the app manually on a device.  
We checked that:

- XP updates correctly
- pages navigate without errors
- challenge completion is saved
- the app runs normally on Android

Manual testing was enough for the MVP.

## 5. Limitations
Since this is an MVP, the app still has limitations:

- no real validation
- no authentication
- no camera or GPS
- simple UI

## 6. Future Improvements
If we continue the app later, we could add:

- camera proof for completing challenges
- GPS to confirm locations
- badges, levels, and rewards
- a map of challenge locations
- user profiles and login

## 7. Reflection
This project helped us practice planning a project, organizing code, writing documentation, and structuring a simple mobile app.  
The MVP meets the class requirements and gives us a base to build a more advanced version of SnapQuest in the future.
