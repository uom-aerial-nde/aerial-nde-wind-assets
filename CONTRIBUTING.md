# How to add work to this repo

## First time
1. Make a free GitHub account and send your username to the repo owner to be added.
2. Install GitHub Desktop (easiest) or use `git` from the command line.
3. Clone the repo: GitHub Desktop -> File -> Clone repository.

## Every time you work
1. **Pull** first (GitHub Desktop: "Fetch origin", then "Pull").
2. Make your changes in the right folder (see the table in `README.md`).
3. **Commit** with a short message saying what you did, e.g. `Add outer-loop PID for x/y`.
4. **Push**.

## Rules
- Put work in your subsystem's folder. Each folder has a README saying what belongs there.
- Do not commit large videos or datasets (over ~50 MB). Put them on OneDrive and link them.
- Do not commit passwords, API keys or personal data.
- Simulink: close the model before committing, and commit the `.slx` only (not `slprj/` or `.slxc`).
- For bigger changes, make a branch (e.g. `control/outer-loop`) and open a pull request so someone else can check it.
- Add a line to the folder README when you add something new, so others can find it.
