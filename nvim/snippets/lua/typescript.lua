local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("typescript", {

  -- Angular Component
  s("a-component", {
    t({ "import { Component, OnInit } from '@angular/core';", "", "@Component({", "\tselector: '" }),
    i(1, "selector-name"),
    t({ "',", "\ttemplateUrl: '" }),
    i(2, "name"),
    t({ ".component.html'", "})", "", "export class " }),
    i(3, "Name"),
    t("Component implements OnInit {"),
    t({ "", "\tconstructor() { }", "", "\tngOnInit() { }" }),
    i(0),
    t({ "", "}" }),
  }),

  -- Angular Standalone Component
  s("a-component-standalone", {
    t({
      "import { Component, OnInit } from '@angular/core';",
      "",
      "@Component({",
      "\tstandalone: true,",
      "\timports: [],",
      "\tselector: '",
    }),
    i(1, "selector-name"),
    t({ "',", "\ttemplateUrl: '" }),
    i(2, "name"),
    t({ ".component.html'", "})", "", "export class " }),
    i(3, "Name"),
    t("Component implements OnInit {"),
    t({ "", "\tconstructor() { }", "", "\tngOnInit() { }" }),
    i(0),
    t({ "", "}" }),
  }),

  -- Angular Component Inline Template
  s("a-component-inline", {
    t({ "import { Component, OnInit } from '@angular/core';", "", "@Component({", "\tselector: '" }),
    i(1, "selector-name"),
    t({ "',", "\ttemplate: `" }),
    i(2),
    t({ "`", "})", "", "export class " }),
    i(3, "Name"),
    t("Component implements OnInit {"),
    t({ "", "\tconstructor() { }", "", "\tngOnInit() { }" }),
    i(0),
    t({ "", "}" }),
  }),

  -- Angular Pipe
  s("a-pipe", {
    t({ "import { Pipe, PipeTransform } from '@angular/core';", "", "@Pipe({", "\tname: '" }),
    i(1, "selector-name"),
    t({ "'", "})", "", "export class " }),
    i(2, "Name"),
    t("Pipe implements PipeTransform {"),
    t({ "", "\ttransform(value: any, ...args: any[]): any {" }),
    i(0),
    t({ "", "\t}", "}" }),
  }),

  -- Angular Service
  s("a-service", {
    t({ "import { Injectable } from '@angular/core';", "", "@Injectable({providedIn: " }),
    i(1, "'root'"),
    t({ "})", "export class " }),
    i(2, "ServiceName"),
    t("Service {"),
    t({ "", "\tconstructor() { }" }),
    i(0),
    t({ "", "}" }),
  }),

  -- Angular HttpClient Service
  s("a-service-httpclient", {
    t({
      "import { Injectable } from '@angular/core';",
      "import { HttpClient } from '@angular/common/http';",
      "",
      "@Injectable({providedIn: ",
    }),
    i(1, "'root'"),
    t({ "})", "export class " }),
    i(2, "ServiceName"),
    t("Service {"),
    t({ "", "\tconstructor(private httpClient: HttpClient) { }" }),
    i(0),
    t({ "", "}" }),
  }),

  -- Angular HttpClient.get
  s("a-httpclient-get", {
    t("return this.httpClient.get('"),
    i(1, "url"),
    t("');"),
    i(0),
  }),

  -- Angular HttpInterceptor Logging
  s("a-http-interceptor-logging", {
    t({
      "import { HttpInterceptor, HttpHandler, HttpRequest, HttpEvent, HttpResponse } from '@angular/common/http';",
      "import { Observable } from 'rxjs';",
      "import { tap } from 'rxjs/operators';",
      "",
      "@Injectable()",
      "export class LogInterceptor implements HttpInterceptor {",
      "\tconstructor() {}",
      "",
      "\tintercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {",
      "\t\tconst started = Date.now();",
      "\t\treturn next.handle(req).pipe(",
      "\t\t\ttap(event => {",
      "\t\t\t\tif (event instanceof HttpResponse) {",
      "\t\t\t\t\tconst elapsed = Date.now() - started;",
      "\t\t\t\t\tconsole.log(`Request for \\${req.urlWithParams} took \\${elapsed} ms.`);",
      "\t\t\t\t}",
      "\t\t\t})",
      "\t\t);",
      "\t}",
      "}",
    }),
  }),

  -- Angular HttpInterceptor Headers
  s("a-http-interceptor-headers", {
    t({
      "import { Injectable } from '@angular/core';",
      "import { HttpEvent, HttpInterceptor, HttpHandler, HttpRequest } from '@angular/common/http';",
      "import { Observable } from 'rxjs';",
      "",
      "@Injectable()",
      "export class HeaderInterceptor implements HttpInterceptor {",
      "\tconstructor() {}",
      "",
      "\tintercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {",
      "\t\tconst headers = req.headers",
      "\t\t\t.set('Content-Type', 'application/json');",
      "\t\tconst authReq = req.clone({ headers });",
      "\t\treturn next.handle(authReq);",
      "\t}",
      "}",
    }),
  }),

  -- Angular HttpInterceptor Empty
  s("a-http-interceptor", {
    t({
      "import { Injectable } from '@angular/core';",
      "import { HttpInterceptor, HttpEvent, HttpHandler, HttpRequest } from '@angular/common/http';",
      "import { Observable } from 'rxjs';",
      "",
      "@Injectable()",
      "export class ",
    }),
    i(1, "Your"),
    t(
      "Interceptor implements HttpInterceptor {",
      "\tintercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {",
      "\t\treturn next.handle(req);",
      "\t}",
      "}"
    ),
  }),

  -- Angular Output Event
  s("a-output-event", {
    t("@Output() "),
    i(1, "eventName"),
    t(" = new EventEmitter<"),
    i(2, "eventType"),
    t(">();"),
  }),

  -- Angular Subscribe
  s("a-subscribe", {
    t("this."),
    i(1, "service"),
    t("."),
    i(2, "function"),
    t({ "", "\t.subscribe(" }),
    i(3, "arg"),
    t(" => this."),
    i(4, "property"),
    t(" = "),
    i(3),
    t({ ");", "" }),
    i(0),
  }),

  -- TrackBy Function
  s("a-trackby", {
    i(1, "trackBy"),
    t("(index: number, "),
    i(2, "name"),
    t(": "),
    i(3, "model"),
    t("): "),
    i(4, "number"),
    t({ " {", "  return " }),
    i(2),
    t({ ".id;", "" }),
    i(0),
    t({ "", "}" }),
  }),
})
