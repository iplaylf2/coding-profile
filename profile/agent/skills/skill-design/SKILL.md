---
name: skill-design
description: "Use when creating, reviewing, or improving a reusable agent skill, including which requests should activate it and how it guides work once loaded."
---

# Skill Design

## Contribution and Activation

- In a representative request, what does the agent already get from its
  ordinary context? What additional knowledge or deliberate preference would
  change the work it produces?
- What feature of the request makes that contribution useful? Which nearby
  request shares the vocabulary but calls for different work?
- On a revision, which guidance earns its place? If successive additions
  give a narrow case undue weight, what structure would better serve the
  recurring task?

The runtime presents the name and description before loading the body. What
work would an agent expect from those words, and where does the body guide
that work? Which requests would benefit from the body but be missed by the
description? Which details first become useful after selection?

## Guidance After Activation

- Which choice has the author already made? State the default and its scope.
  For an open judgment, what evidence could lead to different answers, and
  how would each answer change the work?
- Which detail has to be exact for a format or operation to work? Where does
  the order of steps affect the outcome?
- For a closed set, which source defines membership? When examples illustrate
  an open set, what would help the agent recognize an unlisted case? Which
  incidental detail might the examples accidentally teach as a requirement?
- Which source defines a fact the skill depends on? What would the agent
  decide differently if the skill stated it here? What can the agent
  readily look up at the point of use?
- If the skill is installed on its own, what belongs in the body at every
  activation? Which details warrant a bundled resource?

## Checking the Design

The front matter and resource paths can be checked against the target runtime
and repository conventions. Behavioral checks depend on what the design claims.

- For activation, give an evaluator only the available names and descriptions.
  Would realistic paraphrases of a request still select the skill? Would
  similar wording with a different intent lead the evaluator to skip it?
- After activation, what observable feature of the result would show the
  guidance worked? Use the task's normal inputs. To assess what a change adds,
  compare the same task with the previous version or with the skill absent.
- When the judgment is meant to transfer, does it still hold if the artifact
  changes and the underlying decision stays the same? Does a revision still
  handle the cases that made the earlier guidance valuable?
