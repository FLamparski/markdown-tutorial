/* global Tiers:true */

export const Tiers = { // eslint-disable-line no-unused-vars
  BEGINNER: 'Begineer',
  INTERMEDIATE: 'Intermediate',
  ADVANCED: 'Advanced'
};

export class Task {
  constructor(id, userText, verifiers) {
    this.id = id;
    this.userText = userText;
    this.verifiers = verifiers;
  }

  isComplete() {
    return this.verifiers.every((verifier) => {
      return verifier.test(this.userText);
    });
  }
}

export class Lesson {
  constructor(id, index, name, description, tier, tasks) {
    this.id = id;
    this.index = index;
    this.name = name;
    this.tier = tier;
    this.tasks = tasks;
  }

  isComplete() {
    return this.tasks.every((task) => {
      return task.isComplete();
    });
  }
  isInProgress() {
    return !this.isComplete() && this.tasks.some((task) => {
      return task.isComplete();
    });
  }
}
