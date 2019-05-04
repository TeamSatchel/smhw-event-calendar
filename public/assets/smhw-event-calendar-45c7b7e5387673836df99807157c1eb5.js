"use strict"
define("smhw-event-calendar/adapters/application",["exports","ember-data","smhw-event-calendar/config/environment"],function(e,a,t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var n={}
t.default.apiHost&&(n.host=t.default.apiHost)
var r=a.default.JSONAPIAdapter.extend(n)
e.default=r}),define("smhw-event-calendar/app",["exports","smhw-event-calendar/resolver","ember-load-initializers","smhw-event-calendar/config/environment"],function(e,a,t,n){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var r=Ember.Application.extend({modulePrefix:n.default.modulePrefix,podModulePrefix:n.default.podModulePrefix,Resolver:a.default});(0,t.default)(r,n.default.modulePrefix)
var i=r
e.default=i}),define("smhw-event-calendar/helpers/app-version",["exports","smhw-event-calendar/config/environment","ember-cli-app-version/utils/regexp"],function(e,a,t){function n(e){var n=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{},r=a.default.APP.version,i=n.versionOnly||n.hideSha,l=n.shaOnly||n.hideVersion,d=null
return i&&(n.showExtended&&(d=r.match(t.versionExtendedRegExp)),d||(d=r.match(t.versionRegExp))),l&&(d=r.match(t.shaRegExp)),d?d[0]:r}Object.defineProperty(e,"__esModule",{value:!0}),e.appVersion=n,e.default=void 0
var r=Ember.Helper.helper(n)
e.default=r}),define("smhw-event-calendar/helpers/pluralize",["exports","ember-inflector/lib/helpers/pluralize"],function(e,a){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var t=a.default
e.default=t}),define("smhw-event-calendar/helpers/singularize",["exports","ember-inflector/lib/helpers/singularize"],function(e,a){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var t=a.default
e.default=t}),define("smhw-event-calendar/initializers/app-version",["exports","ember-cli-app-version/initializer-factory","smhw-event-calendar/config/environment"],function(e,a,t){var n,r
Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0,t.default.APP&&(n=t.default.APP.name,r=t.default.APP.version)
var i={name:"App Version",initialize:(0,a.default)(n,r)}
e.default=i}),define("smhw-event-calendar/initializers/container-debug-adapter",["exports","ember-resolver/resolvers/classic/container-debug-adapter"],function(e,a){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var t={name:"container-debug-adapter",initialize:function(){var e=arguments[1]||arguments[0]
e.register("container-debug-adapter:main",a.default),e.inject("container-debug-adapter:main","namespace","application:main")}}
e.default=t}),define("smhw-event-calendar/initializers/ember-data",["exports","ember-data/setup-container","ember-data"],function(e,a,t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var n={name:"ember-data",initialize:a.default}
e.default=n}),define("smhw-event-calendar/initializers/export-application-global",["exports","smhw-event-calendar/config/environment"],function(e,a){function t(){var e=arguments[1]||arguments[0]
if(!1!==a.default.exportApplicationGlobal){var t
if("undefined"!=typeof window)t=window
else if("undefined"!=typeof global)t=global
else{if("undefined"==typeof self)return
t=self}var n,r=a.default.exportApplicationGlobal
n="string"==typeof r?r:Ember.String.classify(a.default.modulePrefix),t[n]||(t[n]=e,e.reopen({willDestroy:function(){this._super.apply(this,arguments),delete t[n]}}))}}Object.defineProperty(e,"__esModule",{value:!0}),e.initialize=t,e.default=void 0
var n={name:"export-application-global",initialize:t}
e.default=n}),define("smhw-event-calendar/instance-initializers/ember-data",["exports","ember-data/initialize-store-service"],function(e,a){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var t={name:"ember-data",initialize:a.default}
e.default=t}),define("smhw-event-calendar/resolver",["exports","ember-resolver"],function(e,a){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var t=a.default
e.default=t}),define("smhw-event-calendar/router",["exports","smhw-event-calendar/config/environment"],function(e,a){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var t=Ember.Router.extend({location:a.default.locationType,rootURL:a.default.rootURL})
t.map(function(){})
var n=t
e.default=n}),define("smhw-event-calendar/services/ajax",["exports","ember-ajax/services/ajax"],function(e,a){Object.defineProperty(e,"__esModule",{value:!0}),Object.defineProperty(e,"default",{enumerable:!0,get:function(){return a.default}})}),define("smhw-event-calendar/templates/application",["exports"],function(e){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0
var a=Ember.HTMLBars.template({id:"vO9eaOWk",block:'{"symbols":[],"statements":[[5,"welcome-page",[],[[],[]]],[0,"\\n"],[0,"\\n"],[1,[23,"outlet"],false]],"hasEval":false}',meta:{moduleName:"smhw-event-calendar/templates/application.hbs"}})
e.default=a}),define("smhw-event-calendar/config/environment",[],function(){try{var e="smhw-event-calendar/config/environment",a=document.querySelector('meta[name="'+e+'"]').getAttribute("content"),t={default:JSON.parse(decodeURIComponent(a))}
return Object.defineProperty(t,"__esModule",{value:!0}),t}catch(n){throw new Error('Could not read config from meta tag with name "'+e+'".')}}),runningTests||require("smhw-event-calendar/app").default.create({name:"smhw-event-calendar",version:"0.0.0+29189e22"})
