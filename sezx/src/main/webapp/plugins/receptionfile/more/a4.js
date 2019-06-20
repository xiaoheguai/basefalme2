webpackJsonp([2], {
    "/TTg": function(t, e, o) {
        "use strict";
        var s = o("Dd8w"),
            a = o.n(s),
            i = (o("Idhy"), o("NYxO")),
            n = o("1l6p"),
            c = o("FJ7W"),
            r = "https",
            l = "studyapi.codepku.com",
            d = "https://",
            u = {
                name: "BaseNav",
                data: function() {
                    return {
                        noticeCount: 0,
                        msgPoller: null,
                        activeIndex: "/small_class_room/before_class",
                        beforeClassRoute: {
                            path: "/small_class_room/before_class",
                            query: {
                                id: this.$route.query.id
                            }
                        },
                        homePageRoute: {
                            path: "/small_class_room/home_page",
                            query: {
                                id: this.$route.query.id
                            }
                        },
                        referenceWorkRoute: {
                            path: "/small_class_room/reference_work",
                            query: {
                                id: this.$route.query.id
                            }
                        },
                        goodWorkRoute: {
                            path: "/small_class_room/good_work",
                            query: {
                                id: this.$route.query.id
                            }
                        },
                        classWorkRoute: {
                            path: "/small_class_room/class_work",
                            query: {
                                id: this.$route.query.id
                            }
                        },
                        shouldShowPre: !1,
                        small_class_id: this.$route.query.id,
                        from: this.$route.query.from
                    }
                },
                computed: a()({},
                    Object(i.mapState)({
                        currentUser: function(t) {
                            return t.currentUser
                        }
                    }), {
                        isHome: function() {
                            return "/" === this.$route.path
                        },
                        computedPath: function() {
                            var t = this.$route.path.split("/");
                            return console.log(t),
                                t && t.length ? "/" + t[1] + "/" + t[2] : "/small_class_room/before_class"
                        },
                        hasOldEntrance: function() {
                            return this.currentUser.has_old_course
                        }
                    }),
                props: {
                    setIndex: {
                        type: String
                    },
                    shouldShowOld: {
                        type: Boolean
                    }
                },
                methods: {
                    fetchClassList: function(t) {
                        var e = this;
                        Object(n.z)(t).then(function(t) {
                            console.log(t),
                                e.shouldShowPre = t.small_class_times.some(function(t) {
                                    if (t.is_classing) return "sct" !== e.from && e.$router.push({
                                        path: "/small_class_room/before_class/?id=" + e.$route.query.id
                                    }),
                                        !0
                                })
                        }).
                        catch(function(t) {
                            console.log(t)
                        })
                    },
                    fetchUnreadMessage: function() {
                        var e = this;
                        Object(n._24)().then(function(t) {
                            e.noticeCount = t.num,
                                e.noticeType = t.type
                        }).
                        catch(function(t) {})
                    },
                    handlerLogin: function() {
                        var t = location.href;
                        window.location.href = d + "courseweb.dev.codepku.com:8089?redirect_uri=" + t
                    },
                    handlerSelectNav: function(t, e) {
                        var s = {
                            index: t,
                            indexPath: e
                        };
                        this.$emit("selectNav", s),
                        "/" == s.index && this.isHome && location.reload()
                    },
                    handlerUserInfo: function(t) {
                        var e = this,
                            s = window.location.href;
                        if ("logout" == t) Object(n._32)(s).then(function(t) {
                            e.$message.success("退出成功"),
                                localStorage.clear(),
                                location.href = d + "www.codepku.com/login"
                        }).
                        catch(function(t) {
                            e.$message.error(t.message || "退出失败")
                        });
                        else if ("switchOld" == t) {
                            var o = this.$route.path.split("/");
                            "live" == o[2] ? location.href = r + "://" + l + "/user/personal#liveLessonBWBX": "recorded" == o[2] ? location.href = r + "://" + l + "/user/personal#recordLessonBWBX": "special" == o[1] ? location.href = r + "://" + l + "/user/personal#lectureCoursesBWBX": location.href = r + "://" + l + "/user/personal"
                        }
                    },
                    handlerViewMessage: function() {
                        this.$router.push({
                            path: "/small_class_room/message_notice#" + this.noticeType,
                            query: {
                                id: this.$route.query.id
                            }
                        })
                    }
                },
                created: function() {
                    this.fetchUnreadMessage(),
                        this.fetchClassList(this.small_class_id)
                },
                mounted: function() {
                    var t = this;
                    c.a.$on("getMsg",
                        function() {
                            t.fetchUnreadMessage(),
                                console.log("getMsg")
                        })
                },
                beforeDestroy: function() {
                    c.a.$off("getMsg")
                }
            },
            h = {
                render: function() {
                    var t = this,
                        e = t.$createElement,
                        s = t._self._c || e;
                    return s("el-header", {
                            staticClass: "width-100"
                        },
                        [s("div", {
                                staticClass: "header-main"
                            },
                            [s("a", {
                                    staticClass: "codepku-logo",
                                    attrs: {
                                        href: "https://www.codepku.com/"
                                    }
                                },
                                [s("img", {
                                    staticClass: "padding-top",
                                    attrs: {
                                        src: o("9QGR")
                                    }
                                })]), t._v(" "), s("el-menu", {
                                    staticClass: "float-left",
                                    attrs: {
                                        "default-active": t.computedPath,
                                        mode: "horizontal",
                                        router: !0,
                                        "background-color": "#388aff",
                                        "text-color": "#fff",
                                        "active-text-color": "#ffd04b"
                                    },
                                    on: {
                                        select: t.handlerSelectNav
                                    }
                                },
                                [t.shouldShowPre ? s("el-menu-item", {
                                        attrs: {
                                            route: t.beforeClassRoute,
                                            index: "/small_class_room/before_class"
                                        }
                                    },
                                    [t._v("课前准备")]) : t._e(), t._v(" "), s("el-menu-item", {
                                        attrs: {
                                            route: t.homePageRoute,
                                            index: "/small_class_room/home_page"
                                        }
                                    },
                                    [t._v("班级文化")]), t._v(" "), s("el-menu-item", {
                                        attrs: {
                                            route: t.referenceWorkRoute,
                                            index: "/small_class_room/reference_work"
                                        }
                                    },
                                    [t._v("参考作业")]), t._v(" "), s("el-menu-item", {
                                        attrs: {
                                            route: t.goodWorkRoute,
                                            index: "/small_class_room/good_work"
                                        }
                                    },
                                    [t._v("优秀作业")]), t._v(" "), s("el-menu-item", {
                                        attrs: {
                                            route: t.classWorkRoute,
                                            index: "/small_class_room/class_work"
                                        }
                                    },
                                    [t._v("班级作业")])], 1), t._v(" "), s("div", {
                                    staticClass: "float-right box-right"
                                },
                                [s("div", {
                                        staticClass: "message-notice",
                                        on: {
                                            click: t.handlerViewMessage
                                        }
                                    },
                                    [s("el-badge", {
                                            attrs: {
                                                value: t.noticeCount,
                                                max: 99,
                                                hidden: 0 == t.noticeCount
                                            }
                                        },
                                        [s("i", {
                                            staticClass: "iconfont icon-zixundianji"
                                        })])], 1), t._v(" "), s("div", {
                                        staticClass: "user_info"
                                    },
                                    [t.currentUser ? t._e() : s("el-button", {
                                            attrs: {
                                                type: "text"
                                            },
                                            on: {
                                                click: t.handlerLogin
                                            }
                                        },
                                        [t._v("登录")]), t._v(" "), t.currentUser.name ? s("el-dropdown", {
                                            on: {
                                                command: t.handlerUserInfo
                                            }
                                        },
                                        [s("span", {
                                                staticClass: "el-dropdown-link"
                                            },
                                            [s("router-link", {
                                                    attrs: {
                                                        to: {
                                                            path: "/"
                                                        }
                                                    }
                                                },
                                                [s("img", {
                                                    staticClass: "avatar",
                                                    attrs: {
                                                        src: t.currentUser.avatar
                                                    }
                                                })])], 1), t._v(" "), s("el-dropdown-menu", {
                                                staticClass: "user-dropdown",
                                                attrs: {
                                                    slot: "dropdown"
                                                },
                                                slot: "dropdown"
                                            },
                                            [s("el-dropdown-item", {
                                                    staticClass: "color-primary logout",
                                                    attrs: {
                                                        command: "logout"
                                                    }
                                                },
                                                [t._v("注销")]), t._v(" "), s("el-dropdown-item", {
                                                    staticClass: "user-photo",
                                                    attrs: {
                                                        command: "photo"
                                                    }
                                                },
                                                [s("div", {
                                                        staticClass: "dropdown_item"
                                                    },
                                                    [s("router-link", {
                                                            staticClass: "flex flex-align-item flex-direction-row",
                                                            attrs: {
                                                                to: {
                                                                    path: "/"
                                                                }
                                                            }
                                                        },
                                                        [s("img", {
                                                            attrs: {
                                                                src: t.currentUser.avatar
                                                            }
                                                        }), t._v(" "), s("span", {
                                                                staticStyle: {
                                                                    "margin-left": "10px"
                                                                }
                                                            },
                                                            [t._v(t._s(t.currentUser.name))])])], 1)]), t._v(" "), t.hasOldEntrance ? s("el-dropdown-item", {
                                                    staticClass: "color-primary switch-old",
                                                    attrs: {
                                                        command: "switchOld"
                                                    }
                                                },
                                                [t._v("切换旧版个人中心")]) : t._e()], 1)], 1) : t._e()], 1)])], 1)])
                },
                staticRenderFns: []
            };
        var _ = o("VU/8")(u, h, !1,
            function(t) {
                o("tquU")
            },
            "data-v-45fcbf46", null);
        e.a = _.exports
    },
    "6ATh": function(t, e) {},
    Lb2a: function(t, e, s) {
        "use strict";
        Object.defineProperty(e, "__esModule", {
            value: !0
        });
        var o = s("Ynqt"),
            a = s("kfYy"),
            i = s("/TTg"),
            n = s("FJ7W"),
            c = s("1l6p"),
            r = {
                data: function() {
                    return {
                        activeIndex: "sysMessage",
                        sysMessage: [],
                        interMessage: [],
                        dialogVisible: !1,
                        msgBody: "",
                        from: this.$route.query.from
                    }
                },
                methods: {
                    handleClick: function() {
                        console.log("tab-clicked")
                    },
                    fetchNotificationList: function(e) {
                        var s = this;
                        return n.a.$emit("getMsg"),
                            console.log("blabla"),
                            Object(c._4)(e).then(function(t) {
                                1 == e ? (console.log(t), s.sysMessage = t) : (console.log(t), s.interMessage = t)
                            }).
                            catch(function(t) {
                                console.log(t)
                            })
                    },
                    deleteMessage: function(t) {
                        var e = this;
                        Object(c.o)(t.id).then(function(t) {
                            console.log(t),
                                e.fetchNotificationList(e.msgType)
                        }).
                        catch(function(t) {
                            console.log(t)
                        })
                    },
                    checkItOut: function(t, e) {
                        if (console.log(t, e), "sysMessage" == this.activeIndex) console.log(t),
                            "get_certificate" == t.name ? e && (console.log(e), 2 == e.type ? console.log("") : 1 == e.type && this.$router.push({
                                path: "/user_system",
                                query: {
                                    certificate: e.id
                                }
                            })) : "system" == t.name && (this.dialogVisible = !0, console.log(t), this.msgBody = t.body);
                        else {
                            var s = this.$router.resolve({
                                path: "/works/" + t.content_id
                            }).href;
                            window.open(s, "_blank"),
                                console.log(t)
                        }
                    },
                    clearMessage: function() {
                        var e = this;
                        console.log(this.interMessage),
                            this.$confirm("确定清空消息吗？").then(function() {
                                var t = (1 == e.msgType ? e.sysMessage: e.interMessage).map(function(t, e) {
                                    return t.id
                                });
                                0 < t.length && (Object(c.l)(t).then(function(t) {
                                    e.fetchNotificationList(e.msgType)
                                }).
                                catch(function(t) {
                                    console.log(t)
                                }), console.log(t))
                            }).
                            catch(function() {
                                console.log("cancel")
                            })
                    }
                },
                computed: {
                    msgType: function() {
                        return "sysMessage" == this.activeIndex ? 1 : 2
                    }
                },
                components: {
                    BaseNav: a.a,
                    BaseFooter: o.a,
                    BaseSmallClassNav: i.a
                },
                created: function() {
                    console.log(this.$route.hash),
                        "1" == this.$route.hash.split("#")[1] ? (this.activeIndex = "sysMessage", this.fetchNotificationList(1)) : "2" == this.$route.hash.split("#")[1] ? this.activeIndex = "interMessage": this.fetchNotificationList(1)
                },
                watch: {
                    activeIndex: function(t) {
                        console.log("tab changed"),
                            this.fetchNotificationList(this.msgType)
                    }
                }
            },
            l = {
                render: function() {
                    var o = this,
                        t = o.$createElement,
                        a = o._self._c || t;
                    return a("div", [a("div", {
                            staticClass: "container"
                        },
                        [a("el-tabs", {
                                staticClass: "outer_tab",
                                on: {
                                    "tab-click": o.handleClick
                                },
                                model: {
                                    value: o.activeIndex,
                                    callback: function(t) {
                                        o.activeIndex = t
                                    },
                                    expression: "activeIndex"
                                }
                            },
                            [a("el-tab-pane", {
                                    attrs: {
                                        label: "系统消息",
                                        name: "sysMessage"
                                    }
                                },
                                [0 < o.sysMessage.length ? a("div", {
                                        staticClass: "msg-box"
                                    },
                                    o._l(o.sysMessage,
                                        function(s, t) {
                                            return a("div", {
                                                    key: t,
                                                    staticClass: "msg"
                                                },
                                                [Array.isArray(s.description) ? a("div", {
                                                        staticClass: "box-left",
                                                        class: {
                                                            is_read: s.is_read
                                                        }
                                                    },
                                                    o._l(s.description,
                                                        function(e, t) {
                                                            return a("span", {
                                                                key: t,
                                                                staticClass: "msg-text",
                                                                class: {
                                                                    no_pointer: 2 == e.type
                                                                },
                                                                domProps: {
                                                                    innerHTML: o._s(e.description)
                                                                },
                                                                on: {
                                                                    click: function(t) {
                                                                        o.checkItOut(s, e)
                                                                    }
                                                                }
                                                            })
                                                        })) : a("div", {
                                                        staticClass: "box-left",
                                                        class: {
                                                            is_read: s.is_read
                                                        }
                                                    },
                                                    [a("span", {
                                                        domProps: {
                                                            innerHTML: o._s(s.description)
                                                        },
                                                        on: {
                                                            click: function(t) {
                                                                o.checkItOut(s)
                                                            }
                                                        }
                                                    })]), o._v(" "), a("div", {
                                                        staticClass: "box-right"
                                                    },
                                                    [a("p", [a("span", {
                                                            staticClass: "create-time"
                                                        },
                                                        [o._v(o._s(s.created_at))]), o._v(" "), a("span", {
                                                            staticClass: "show-x delete-btn",
                                                            on: {
                                                                click: function(t) {
                                                                    o.deleteMessage(s)
                                                                }
                                                            }
                                                        },
                                                        [o._v("X")])])])])
                                        })) : a("div", {
                                        staticClass: "msg"
                                    },
                                    [a("p", {
                                            staticStyle: {
                                                "text-align": "center",
                                                width: "100%",
                                                color: "#999"
                                            }
                                        },
                                        [o._v("\n                        暂无系统消息\n                    ")])])]), o._v(" "), a("el-tab-pane", {
                                    attrs: {
                                        label: "互动消息",
                                        name: "interMessage"
                                    }
                                },
                                [0 < o.interMessage.length ? a("div", {
                                        staticClass: "msg-box"
                                    },
                                    o._l(o.interMessage,
                                        function(s, t) {
                                            return a("div", {
                                                    key: t,
                                                    staticClass: "msg"
                                                },
                                                [Array.isArray(s.description) ? a("div", {
                                                        staticClass: "box-left",
                                                        class: {
                                                            is_read: s.is_read
                                                        }
                                                    },
                                                    o._l(s.description,
                                                        function(e, t) {
                                                            return a("span", {
                                                                    key: t,
                                                                    staticClass: "msg-text",
                                                                    on: {
                                                                        click: function(t) {
                                                                            o.checkItOut(s, e)
                                                                        }
                                                                    }
                                                                },
                                                                [o._v(o._s(e.description))])
                                                        })) : a("div", {
                                                        staticClass: "box-left",
                                                        class: {
                                                            is_read: s.is_read
                                                        }
                                                    },
                                                    [a("span", {
                                                            on: {
                                                                click: function(t) {
                                                                    o.checkItOut(s)
                                                                }
                                                            }
                                                        },
                                                        [o._v(o._s(s.description))])]), o._v(" "), a("div", {
                                                        staticClass: "box-right"
                                                    },
                                                    [a("p", [a("span", {
                                                            staticClass: "create-time"
                                                        },
                                                        [o._v(o._s(s.created_at))]), o._v(" "), a("span", {
                                                            staticClass: "show-x delete-btn",
                                                            on: {
                                                                click: function(t) {
                                                                    o.deleteMessage(s)
                                                                }
                                                            }
                                                        },
                                                        [o._v("X")])])])])
                                        })) : a("div", {
                                        staticClass: "msg"
                                    },
                                    [a("p", {
                                            staticStyle: {
                                                "text-align": "center",
                                                width: "100%",
                                                color: "#999"
                                            }
                                        },
                                        [o._v("\n                        暂无互动消息\n                    ")])])])], 1), o._v(" "), a("el-button", {
                                staticClass: "clear-btn",
                                attrs: {
                                    type: "text"
                                },
                                on: {
                                    click: o.clearMessage
                                }
                            },
                            [a("i", {
                                staticClass: "el-icon-delete"
                            }), o._v("全部清空")]), o._v(" "), o.dialogVisible ? a("el-dialog", {
                                attrs: {
                                    title: "消息详情",
                                    visible: o.dialogVisible,
                                    width: "940px",
                                    center: ""
                                },
                                on: {
                                    "update:visible": function(t) {
                                        o.dialogVisible = t
                                    }
                                }
                            },
                            [a("div", {
                                staticClass: "msg-rich-content",
                                domProps: {
                                    innerHTML: o._s(o.msgBody)
                                }
                            })]) : o._e()], 1)])
                },
                staticRenderFns: []
            };
        var d = s("VU/8")(r, l, !1,
            function(t) {
                s("aOLL")
            },
            "data-v-472dcca9", null);
        e.
            default = d.exports
    },
    Ynqt: function(t, e, o) {
        "use strict";
        var s = {
            render: function() {
                var t = this,
                    e = t.$createElement,
                    s = t._self._c || e;
                return s("el-footer", {
                        staticClass: "width-100",
                        class: {
                            noMargin: t.noMargin
                        }
                    },
                    [s("div", {
                            staticClass: "footer_content"
                        },
                        [s("div", {
                                staticClass: "about_us"
                            },
                            [s("p", [s("img", {
                                attrs: {
                                    src: o("9QGR"),
                                    alt: ""
                                }
                            })]), t._v(" "), s("p", [t._v("关注我们：\n                "), s("el-popover", {
                                    attrs: {
                                        placement: "top-start",
                                        width: "200",
                                        trigger: "hover"
                                    }
                                },
                                [s("div", {
                                        staticClass: "wexin_code"
                                    },
                                    [s("div", [s("p", [t._v("公众号")]), t._v(" "), s("img", {
                                        attrs: {
                                            src: "https://cdn.codepku.com//img/course/introduce-v5/qrcode_20171228192147.jpg",
                                            alt: ""
                                        }
                                    })]), t._v(" "), s("div", [s("p", [t._v("晓雯老师")]), t._v(" "), s("img", {
                                        attrs: {
                                            src: "https://cdn.codepku.com//img/course/introduce-v5/qrcode_201712281925.jpg",
                                            alt: ""
                                        }
                                    })])]), t._v(" "), s("span", {
                                        attrs: {
                                            slot: "reference"
                                        },
                                        slot: "reference"
                                    },
                                    [s("i", {
                                        staticClass: "fa fa-weixin"
                                    })])]), t._v(" "), s("span", [s("i", {
                                staticClass: "fa fa-qq"
                            })]), t._v(" "), s("span", [s("i", {
                                staticClass: "fa fa-weibo"
                            })])], 1), t._v(" "), s("p", [t._v("Copyright©2016Codepku Tech.")]), t._v(" "), s("p", [t._v("粤ICP备15056056号-1")])]), t._v(" "), s("div", {
                                staticClass: "contact_us"
                            },
                            [s("h4", [t._v("联系我们")]), t._v(" "), s("ul", [s("li", [t._v("深圳市编玩边学教育科技有限公司")]), t._v(" "), s("li", [t._v("地址：深圳市南山区侨香路4060号花样年·香年广场C座12楼")]), t._v(" "), s("li", [t._v("电话：400-636-1878 0755-86950656")]), t._v(" "), s("li", [t._v("邮箱：team@codepku.com")])])]), t._v(" "), s("div", {
                                staticClass: "other_service"
                            },
                            [s("h4", [t._v("其他服务")]), t._v(" "), s("ul", [s("li", [s("a", {
                                    attrs: {
                                        href: "https://www.codepku.com/"
                                    }
                                },
                                [t._v("编玩边学官网")])]), t._v(" "), s("li", [s("a", {
                                    attrs: {
                                        href: "http://kids.codepku.com/"
                                    }
                                },
                                [t._v("编程少年")])]), t._v(" "), s("li", [s("a", {
                                    attrs: {
                                        href: "http://scratch.codepku.com/"
                                    }
                                },
                                [t._v("Scratch官网")])])])]), t._v(" "), s("div", {
                                staticClass: "free_trial"
                            },
                            [s("img", {
                                attrs: {
                                    src: "https://cdn.codepku.com/img/course/introduce-v5/qrcode_20171228183355.jpg",
                                    alt: ""
                                }
                            }), t._v(" "), s("p", [t._v("免费领取千元试听课")])])])])
            },
            staticRenderFns: []
        };
        var a = o("VU/8")({
                name: "BaseFooter",
                computed: {
                    noMargin: function() {
                        if ("exchange_course" === this.$route.path.split("/")[1]) return ! 0
                    }
                }
            },
            s, !1,
            function(t) {
                o("6ATh")
            },
            "data-v-0b4ec03a", null);
        e.a = a.exports
    },
    aOLL: function(t, e) {},
    tquU: function(t, e) {}
});