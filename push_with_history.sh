#!/bin/bash

# ─────────────────────────────────────────────
# EPAM Java Fundamentals — backdated git push
# Usage: paste this file into your project root
# then run: bash push_with_history.sh
# ─────────────────────────────────────────────

REMOTE="https://github.com/AgilHummatli/Epam-Java-Fundamentals.git"
START_DATE="2026-01-15"
END_DATE="2026-06-10"

# ── 1. Init repo if not already ──────────────
if [ ! -d ".git" ]; then
  git init
  git branch -M main
  git remote add origin "$REMOTE"
  echo "✅ Git initialized"
else
  echo "ℹ️  Git already initialized"
fi

# ── 2. Add README first ───────────────────────
if [ -f "README.md" ]; then
  git add README.md
  GIT_AUTHOR_DATE="${START_DATE}T09:00:00" \
  GIT_COMMITTER_DATE="${START_DATE}T09:00:00" \
  git commit -m "Add README"
  echo "✅ README committed"
fi

# ── 3. Collect all java/config files ─────────
mapfile -d '' files < <(find . -not -path "./.git/*" \
  \( -name "*.java" -o -name "*.xml" -o -name "*.yml" \
     -o -name "*.yaml" -o -name "*.properties" \
     -o -name "pom.xml" -o -name "*.gradle" \) \
  -print0 | sort -z)

total=${#files[@]}
echo "📦 Found $total files to commit"

# ── 4. Calculate days between dates ──────────
start_ts=$(date -j -f "%Y-%m-%d" "$START_DATE" "+%s")
end_ts=$(date -j -f "%Y-%m-%d" "$END_DATE" "+%s")
total_days=$(( (end_ts - start_ts) / 86400 ))

# files per day (at least 1)
per_day=$(( total / total_days ))
[ $per_day -lt 1 ] && per_day=1

# ── 5. Commit files day by day ────────────────
i=0
current_ts=$start_ts

while [ $i -lt $total ]; do
  current_date=$(date -j -f "%s" "$current_ts" "+%Y-%m-%d")

  # pick a random-ish commit time between 10:00 and 20:00
  hour=$(( (RANDOM % 10) + 10 ))
  min=$(( RANDOM % 60 ))
  commit_time="${current_date}T$(printf "%02d" $hour):$(printf "%02d" $min):00"

  # stage per_day files (sometimes +1 for variety)
  batch=$(( per_day + (RANDOM % 2) ))
  staged=0

  for j in $(seq 1 $batch); do
    if [ $i -lt $total ]; then
      git add "${files[$i]}"
      i=$((i + 1))
      staged=$((staged + 1))
    fi
  done

  if [ $staged -gt 0 ]; then
    # pick a varied commit message
    messages=(
      "Add solutions"
      "Complete module task"
      "Implement task"
      "Finish coding task"
      "Submit solution"
      "Working solution"
      "Task complete"
    )
    msg=${messages[$RANDOM % ${#messages[@]}]}

    GIT_AUTHOR_DATE="$commit_time" \
    GIT_COMMITTER_DATE="$commit_time" \
    git commit -m "$msg" 2>/dev/null

    echo "📅 $current_date — committed $staged files"
  fi

  # advance to next day
  current_ts=$(( current_ts + 86400 ))

  # don't go past end date
  if [ $current_ts -gt $end_ts ]; then
    break
  fi
done

# ── 6. Commit any leftover files ─────────────
git add . 2>/dev/null
remaining=$(git diff --cached --name-only | wc -l)
if [ $remaining -gt 0 ]; then
  GIT_AUTHOR_DATE="${END_DATE}T18:00:00" \
  GIT_COMMITTER_DATE="${END_DATE}T18:00:00" \
  git commit -m "Final solutions"
  echo "✅ Committed $remaining remaining files"
fi

# ── 7. Push ───────────────────────────────────
echo "🚀 Pushing to GitHub..."
git push -u origin main

echo ""
echo "✅ Done! Check: https://github.com/AgilHummatli/Epam-Java-Fundamentals"
