---
name: reference-voice
version: 1.0.0
description: Write documentation, release notes and UI copy in reference voice, stating the fact and stopping rather than arguing for it.
triggers:
  - "write documentation"
  - "write a blog post"
  - "review this prose"
  - "docs page"
  - "release notes"
  - "rewrite this readme"
allowed-tools: [Read, Write, Edit, Bash]
---

# Reference Voice Skill

## When to invoke this skill

Use it for any prose a reader will treat as reference: documentation pages,
README sections, release notes, blog posts, skill files, commit messages and UI
strings.

There are two registers. Reference voice states a fact and stops. Essay voice
argues, frames and performs. Reference voice is the default for engineering
writing. Essay voice is what prose drifts into when it is generated rather than
written, which is why a reader often calls it machine-written without being able
to say which sentence gave it away.

Do not use this skill for code, tests or configuration.

## Inputs

- the draft, or the subject to write about
- the neighbouring files, which already set the house style
- the facts the text has to carry

## Outputs

- prose carrying every fact, with no sentence defending one
- an em dash count of zero
- a register that matches the files beside it

## Rules

- State the fact. Do not argue for it.
- Delete any sentence whose subject is the text itself.
- Do not define a thing by what it is not.
- Do not answer an objection the reader has not raised.
- Do not end a paragraph on an epigram.
- Use no em dashes. Where one wants to go, end the sentence or use a comma or a
  colon.
- Prefer two items to three when the third is there for rhythm.
- Read the neighbouring files before assuming a house style.

## The six tells of essay voice

1. Metadiscourse. A sentence about the text, or about the writer's own rigour,
   instead of about the subject. "That figure is not typed into the page."
   "The other thing worth being honest about." "Enumerated exactly."
2. Negative definition. "X, not Y", where nobody proposed Y. The strawman
   exists so the sentence can knock it down.
3. Preemptive defence. Answering an objection the reader has not raised,
   usually parked beside a number to guard it.
4. Aphoristic closer. A paragraph ending on a line built to be quoted.
5. Em dash appositive. A qualification bolted on with a dash instead of ended
   with a full stop. This is the mechanical symptom of the other five, which is
   why counting dashes catches the register even when the ear misses it.
6. Triads for rhythm. Three items where two carry the meaning.

## UI strings

The same rule applied harder, because a UI string has no room to recover. State
what the control does and how to turn it off. No reassurance copy: not "nothing
about you is sent", not "we never store", not "your data stays local". Naming
the environment variable that disables a behaviour is useful and belongs in the
string. The product's stance on privacy belongs in the documentation, where a
reader who wants it can find it.

## Checks

Run all three before committing prose.

1. Delete test. Remove the clause. If every fact survives, it was essay voice,
   so delete it for real.
2. Fact test. Ask whether the sentence adds a fact or defends one. Defenders go.
3. Count. The em dash count must be zero. Fix by shortening the sentence, never
   by swapping in a different dash.

```sh
python3 -c "import pathlib; print(pathlib.Path('FILE').read_text().count(chr(8212)))"
```

The count matters more than it looks. A writer who knows the rule still breaks
it, because the dash arrives with the sentence rather than after it.

## Acceptance Criteria

The prose is acceptable when it:

- carries every fact the draft carried
- contains no em dashes
- contains no sentence that survives the delete test
- reads in the same register as the files beside it
- tells the reader how to turn a behaviour off instead of reassuring them about it
