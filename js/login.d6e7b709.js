newFunction();

function newFunction() {
    (window["webpackJsonp"] = window["webpackJsonp"] || []).push([["login"], {
        5326: function(t, e, r) {
            "use strict"; r.r(e); var a = function() { var t = this, e = t.$createElement, r = t._self._c || e; return r("div", { staticClass: "login-panel" }, [r("div", { staticClass: "card card-auth  with-shadow" }, [t._m(0), r("div", { staticClass: "auth-body" }, [r("b-form", { on: { submit: function(e) { return e.stopPropagation(), e.preventDefault(), t.onSubmit.apply(null, arguments); } } }, [r("b-form-group", { attrs: { id: "login_username", label: "Username", "label-for": "login-username-input" } }, [r("b-form-input", { directives: [{ name: "validate", rawName: "v-validate", value: { required: !0, max: 20, min: 6 }, expression: "{ required: true, max: 20, min: 6 }" }], class: { "is-invalid": t.errors.has("username") }, attrs: { id: "login_username", placeholder: "Enter your account username", autocomplete: "off", "data-vv-name": "username" }, model: { value: t.formData.username, callback: function(e) { t.$set(t.formData, "username", e); }, expression: "formData.username" } })], 1), r("b-form-group", { attrs: { id: "login_password", label: "Password", type: "password", "label-for": "login-password-input" } }, [r("b-form-input", { directives: [{ name: "validate", rawName: "v-validate", value: { required: !0, max: 20, min: 6 }, expression: "{ required: true, max: 20, min: 6 }" }], class: { "is-invalid": t.errors.has("password") }, attrs: { id: "login-password-input", placeholder: "Enter your account password", autocomplete: "off", type: "password", "data-vv-name": "password" }, model: { value: t.formData.password, callback: function(e) { t.$set(t.formData, "password", e); }, expression: "formData.password" } })], 1), r("base-button", { class: t.loading ? "disabled" : "", attrs: { "btn-label": "Sign In", "btn-type": "submit", "btn-variant": "primary", disabled: t.loading } }), r("router-link", { staticClass: "btn forgot-link btn-link float-right", attrs: { to: "auth/forgot-password" } }, [t._v("Forgot your password?")])], 1)], 1)])]); }, n = [function() { var t = this, e = t.$createElement, r = t._self._c || e; return r("h2", { staticClass: "auth-heading" }, [t._v("\n            Login to your account\n            "), r("span", [t._v("\n                Please enter your account credentials.\n            ")])]); } ], s = (r("8e6e"), r("ac6a"), r("cadf"), r("456d"), r("6b54"), r("96cf"), r("3b8d")), o = r("bd86"), i = r("2f62"), c = r("6c6e"); function u(t, e) { var r = Object.keys(t); if (Object.getOwnPropertySymbols) { var a = Object.getOwnPropertySymbols(t); e && (a = a.filter((function(e) { return Object.getOwnPropertyDescriptor(t, e).enumerable; }))), r.push.apply(r, a); } return r; } function l(t) { for (var e = 1; e < arguments.length; e++) { var r = null != arguments[e] ? arguments[e] : {}; e % 2 ? u(Object(r), !0).forEach((function(e) { Object(o["a"])(t, e, r[e]); })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(r)) : u(Object(r)).forEach((function(e) { Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(r, e)); })); } return t; } var p = new c["a"]("configurations/branding"), d = {
                components: {}, props: {}, data: function() { return { formData: this.initializeFormData() }; }, computed: l({}, Object(i["b"])(["loading", "user", "success", "redirectUrl"])), watch: { user: function(t) { null !== t && void 0 !== t && (this.redirectUrl ? (this.$router.push({ path: this.redirectUrl }), this.$store.commit("setRedirectUrl", null)) : this.$router.push({ name: "view-alerts" })); } }, created: function() {
                    var t = Object(s["a"])(regeneratorRuntime.mark((function t() {
                        return regeneratorRuntime.wrap((function(t) {
                            while (1)
                                switch (t.prev = t.next) { case 0: return t.next = 2, this.getBrandingData(); case 2: case "end": return t.stop(); }
                        }), t, this);
                    }))); function e() { return t.apply(this, arguments); } return e;
                } (), methods: {
                    initializeFormData: function() { return { username: "", password: "", loginAt: "" }; }, onSubmit: function() {
                        var t = Object(s["a"])(regeneratorRuntime.mark((function t() {
                            var e, r; return regeneratorRuntime.wrap((function(t) {
                                while (1)
                                    switch (t.prev = t.next) { case 0: return t.next = 2, this.$validator.validateAll(); case 2: if (e = t.sent, !e) { t.next = 15; break; } return t.prev = 4, this.formData.loginAt = Date.now(), r = this.CryptoJS.AES.encrypt(JSON.stringify(this.formData), "A696DFE02D52F65A822F7F3492CDD483C15FF6ECB2C157E1A1E0B5EDDA08F903").toString(), t.next = 9, this.$store.dispatch("authLogin", { data: r }); case 9: t.next = 13; break; case 11: t.prev = 11, t.t0 = t["catch"](4); case 13: t.next = 16; break; case 15: this.$store.commit("setError", this.errors.all()[0]); case 16: case "end": return t.stop(); }
                            }), t, this, [[4, 11]]);
                        }))); function e() { return t.apply(this, arguments); } return e;
                    } (), getBrandingData: function() {
                        var t = Object(s["a"])(regeneratorRuntime.mark((function t() {
                            var e, r; return regeneratorRuntime.wrap((function(t) {
                                while (1)
                                    switch (t.prev = t.next) { case 0: return t.next = 2, p.list(); case 2: e = t.sent, r = e.data, this.$store.commit("setDisplaySetting", r.data); case 5: case "end": return t.stop(); }
                            }), t, this);
                        }))); function e() { return t.apply(this, arguments); } return e;
                    } ()
                }
            }, m = d, f = r("2877"), b = Object(f["a"])(m, a, n, !1, null, null, null); e["default"] = b.exports;
        }, bcfa: function(t, e, r) {
            "use strict"; r.r(e); var a = function() { var t = this, e = t.$createElement, r = t._self._c || e; return r("div", { staticClass: "auth-wrapper middle-aligner" }, [r("div", { staticClass: "inner" }, [r("base-logo", { staticClass: "main-logo" }), r("router-view"), 1 == !t.$route.meta.noFooterBar ? r("div", { staticClass: "contact-link text-center" }, [t._v("\n            Can’t access your account?\n            "), r("router-link", { attrs: { to: "/contact-us" } }, [t._v("Contact us")])], 1) : t._e(), 1 == !t.$route.meta.noFooterBar ? r("div", { staticClass: "contact-link register-now text-center d-none" }, [t._v("\n            Are you a customer?\n            "), r("router-link", { attrs: { to: "/public-registration" } }, [t._v("Register now")])], 1) : t._e()], 1), r("base-footer")], 1); }, n = [], s = { components: {}, props: {}, data: function() { return {}; }, computed: {}, mounted: function() { }, methods: {} }, o = s, i = r("2877"), c = Object(i["a"])(o, a, n, !1, null, null, null); e["default"] = c.exports;
        }
    }]);
}
