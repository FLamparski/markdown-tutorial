/* global Backbone, _ */
/* global Models:true, Collections:true */

window.Models = {};
window.Collections = {};

$(document).on('appLoad', function() {
  let Completable = {
    toggleCompleted: function() {
      this.save({completed: !this.completed});
    }
  };
  Models.Lesson = Backbone.Model.extend(_.extend({
    defaults: function() {
      return {
        id: 0,
        index: 0,
        name: '',
        description: '',
        tier: '',
        tasks: [],
        completed: false
      };
    }
  }, Completable));
  Models.Task = Backbone.Model.extend(_.extend({
    defaults: function() {
      return {
        lesson: 0,
        index: 0,
        name: '',
        inputText: '',
        file: '',
        completed: false
      };
    }
  }, Completable));
  Models.Badge = Backbone.Model.extend(_.extend({
    defaults: function() {
      return {
        name: '',
        description: '',
        image: '',
        completed: false
      };
    }
  }, Completable));

  let IndexOrderable = {
    nextOrder: function() {
      return this.length ? this.last().get('index') + 1 : 0;
    }
  };
  Collections.Lessons = new (Backbone.Collection.extend(_.extend({
    model: Models.Lesson,
    localStorage: new Backbone.LocalStorage('lessons')
  })))();
  Collections.Tasks = new (Backbone.Collection.extend(_.extend({
    model: Models.Task,
    localStorage: new Backbone.LocalStorage('tasks')
  }, IndexOrderable)))();
  Collections.Badges = new (Backbone.Collection.extend({
    model: Models.Badge,
    localStorage: new Backbone.LocalStorage('badges')
  }))();

  Collections.Lessons.fetch().then(function() {
    $.ajax('assets/lessons.json').done(function(data) {
      _.each(data, function(lessonObj) {
        if (!Collections.Lessons.find({id: lessonObj.id})) {
          console.log('new lesson', lessonObj.id, lessonObj.name);
          let lesson = new Models.Lesson();
          lesson.set(lessonObj);
          Collections.Lessons.add(lesson);
          lesson.save();
        }
      });
    });
  });
});
