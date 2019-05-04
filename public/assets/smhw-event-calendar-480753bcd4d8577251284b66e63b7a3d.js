"use strict"
define("smhw-event-calendar/adapters/application",["exports","ember-data","smhw-event-calendar/config/environment"],function(e,t,a){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var n={}
a.default.apiHost&&(n.host=a.default.apiHost)
var r=t.default.JSONAPIAdapter.extend(n)
e.default=r}),define("smhw-event-calendar/app",["exports","smhw-event-calendar/resolver","ember-load-initializers","smhw-event-calendar/config/environment"],function(e,t,a,n){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var r=Ember.Application.extend({modulePrefix:n.default.modulePrefix,podModulePrefix:n.default.podModulePrefix,Resolver:t.default});(0,a.default)(r,n.default.modulePrefix)
var i=r
e.default=i}),define("smhw-event-calendar/helpers/app-version",["exports","smhw-event-calendar/config/environment","ember-cli-app-version/utils/regexp"],function(e,t,a){function n(e){var n=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{},r=t.default.APP.version,i=n.versionOnly||n.hideSha,l=n.shaOnly||n.hideVersion,d=null
return i&&(n.showExtended&&(d=r.match(a.versionExtendedRegExp)),d||(d=r.match(a.versionRegExp))),l&&(d=r.match(a.shaRegExp)),d?d[0]:r}Object.defineProperty(e,"__esModule",{value:!0}),e.appVersion=n,e.default=void 0
var r=Ember.Helper.helper(n)
e.default=r}),define("smhw-event-calendar/helpers/pluralize",["exports","ember-inflector/lib/helpers/pluralize"],function(e,t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var a=t.default
e.default=a}),define("smhw-event-calendar/helpers/singularize",["exports","ember-inflector/lib/helpers/singularize"],function(e,t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var a=t.default
e.default=a}),define("smhw-event-calendar/initializers/app-version",["exports","ember-cli-app-version/initializer-factory","smhw-event-calendar/config/environment"],function(e,t,a){var n,r
Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0,a.default.APP&&(n=a.default.APP.name,r=a.default.APP.version)
var i={name:"App Version",initialize:(0,t.default)(n,r)}
e.default=i}),define("smhw-event-calendar/initializers/container-debug-adapter",["exports","ember-resolver/resolvers/classic/container-debug-adapter"],function(e,t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var a={name:"container-debug-adapter",initialize:function(){var e=arguments[1]||arguments[0]
e.register("container-debug-adapter:main",t.default),e.inject("container-debug-adapter:main","namespace","application:main")}}
e.default=a}),define("smhw-event-calendar/initializers/ember-data",["exports","ember-data/setup-container","ember-data"],function(e,t,a){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var n={name:"ember-data",initialize:t.default}
e.default=n}),define("smhw-event-calendar/initializers/export-application-global",["exports","smhw-event-calendar/config/environment"],function(e,t){function a(){var e=arguments[1]||arguments[0]
if(!1!==t.default.exportApplicationGlobal){var a
if("undefined"!=typeof window)a=window
else if("undefined"!=typeof global)a=global
else{if("undefined"==typeof self)return
a=self}var n,r=t.default.exportApplicationGlobal
n="string"==typeof r?r:Ember.String.classify(t.default.modulePrefix),a[n]||(a[n]=e,e.reopen({willDestroy:function(){this._super.apply(this,arguments),delete a[n]}}))}}Object.defineProperty(e,"__esModule",{value:!0}),e.initialize=a,e.default=void 0
var n={name:"export-application-global",initialize:a}
e.default=n}),define("smhw-event-calendar/instance-initializers/ember-data",["exports","ember-data/initialize-store-service"],function(e,t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var a={name:"ember-data",initialize:t.default}
e.default=a}),define("smhw-event-calendar/models/event",["exports","ember-data"],function(e,t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var a=t.default.Model.extend({description:t.default.attr()})
e.default=a}),define("smhw-event-calendar/resolver",["exports","ember-resolver"],function(e,t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var a=t.default
e.default=a}),define("smhw-event-calendar/router",["exports","smhw-event-calendar/config/environment"],function(e,t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var a=Ember.Router.extend({location:t.default.locationType,rootURL:t.default.rootURL})
a.map(function(){this.route("events",function(){})})
var n=a
e.default=n}),define("smhw-event-calendar/routes/events",["exports"],function(e){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var t=Ember.Route.extend({})
e.default=t}),define("smhw-event-calendar/routes/events/index",["exports"],function(e){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var t=Ember.Route.extend({model:function(){return this.store.findAll("event")}})
e.default=t}),define("smhw-event-calendar/services/ajax",["exports","ember-ajax/services/ajax"],function(e,t){Object.defineProperty(e,"__esModule",{value:!0}),Object.defineProperty(e,"default",{enumerable:!0,get:function(){return t.default}})}),define("smhw-event-calendar/templates/application",["exports"],function(e){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var t=Ember.HTMLBars.template({id:"hsMYaiYK",block:'{"symbols":[],"statements":[[1,[23,"outlet"],false],[0,"\\n"]],"hasEval":false}',meta:{moduleName:"smhw-event-calendar/templates/application.hbs"}})
e.default=t}),define("smhw-event-calendar/templates/events",["exports"],function(e){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var t=Ember.HTMLBars.template({id:"yHIiCiM4",block:'{"symbols":[],"statements":[[7,"h1"],[9],[0,"Calendar"],[10],[0,"\\n"],[1,[23,"outlet"],false],[0,"\\n"]],"hasEval":false}',meta:{moduleName:"smhw-event-calendar/templates/events.hbs"}})
e.default=t}),define("smhw-event-calendar/templates/events/index",["exports"],function(e){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var t=Ember.HTMLBars.template({id:"VO9wq0wK",block:'{"symbols":["event"],"statements":[[7,"h2"],[9],[0,"Events"],[10],[0,"\\n\\n"],[7,"ul"],[9],[0,"\\n"],[4,"each",[[24,0,["model"]]],null,{"statements":[[0,"    "],[7,"li"],[9],[1,[24,1,["description"]],false],[10],[0,"\\n"]],"parameters":[1]},null],[10],[0,"\\n"]],"hasEval":false}',meta:{moduleName:"smhw-event-calendar/templates/events/index.hbs"}})
e.default=t}),define("smhw-event-calendar/config/environment",[],function(){try{var e="smhw-event-calendar/config/environment",t=document.querySelector('meta[name="'+e+'"]').getAttribute("content"),a={default:JSON.parse(decodeURIComponent(t))}
return Object.defineProperty(a,"__esModule",{value:!0}),a}catch(n){throw new Error('Could not read config from meta tag with name "'+e+'".')}}),runningTests||require("smhw-event-calendar/app").default.create({name:"smhw-event-calendar",version:"0.0.0+552e6e33"})
