local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- [class] binding
  s("a-class", {
    t('[class]="'),
    i(1, "expression"),
    t('"'),
  }),

  -- [style] binding
  s("a-style", {
    t("[style."),
    i(1, "property"),
    t(']="'),
    i(2, "expression"),
    t('"'),
  }),

  -- ngClass
  s("a-ngClass", {
    t('[ngClass]="{'),
    i(1, "cssClass"),
    t(": "),
    i(2, "expression"),
    t('}"'),
  }),

  -- *ngFor
  s("a-ngFor", {
    t('*ngFor="let '),
    i(1, "item"),
    t(" of "),
    i(2, "list"),
    t('"'),
  }),

  -- *ngFor with trackBy
  s("a-ngFor-trackBy", {
    t('*ngFor="let '),
    i(1, "item"),
    t(" of "),
    i(2, "list"),
    t("; trackBy:"),
    i(3, "trackByFnName"),
    t('"'),
  }),

  -- *ngForAsync
  s("a-ngForAsync", {
    t('*ngFor="let '),
    i(1, "item"),
    t(" of "),
    i(2, "stream"),
    t(" | async as "),
    i(3, "list"),
    t('"'),
  }),

  -- Form
  s("a-form", {
    t('<form (ngSubmit)="onSubmit()" #'),
    i(1, "form"),
    t('="ngForm">'),
    t({ "", "\t" }),
    i(0),
    t({ "", "</form>" }),
  }),

  -- formArrayName
  s("a-formArrayName", {
    t('formArrayName="'),
    i(1, "control"),
    t('"'),
  }),

  -- formControlName
  s("a-formControlName", {
    t('formControlName="'),
    i(1, "control"),
    t('"'),
  }),

  -- formGroup
  s("a-formGroup", {
    t('[formGroup]="'),
    i(1, "form"),
    t('"'),
  }),

  -- formGroupName
  s("a-formGroupName", {
    t('[formGroupName]="'),
    i(1, "name"),
    t('"'),
  }),

  -- Form submit button
  s("a-form-submit", {
    t('<button type="submit" [disabled]="!'),
    i(1, "form"),
    t('.form.valid">'),
    t({ "", "\tSave", "</button>" }),
  }),

  -- *ngIf
  s("a-ngIf", {
    t('*ngIf="'),
    i(1, "expression"),
    t('"'),
  }),

  -- *ngIfElse
  s("a-ngIfElse", {
    t('*ngIf="'),
    i(1, "expression"),
    t("; else "),
    i(2, "templateName"),
    t('"'),
  }),

  -- ngModel
  s("a-ngModel", {
    t('[(ngModel)]="'),
    i(1, "binding"),
    t('"'),
  }),

  -- routerLink
  s("a-routerLink", {
    t("[routerLink]=\"['"),
    i(1, "routePath"),
    t('\']" routerLinkActive="'),
    i(2, "activeClass"),
    t('"'),
  }),

  -- routerLink with parameter
  s("a-routerLink-param", {
    t("[routerLink]=\"['"),
    i(1, "routePath"),
    t("', "),
    i(2, "param"),
    t(']" routerLinkActive="'),
    i(3, "activeClass"),
    t('"'),
  }),

  -- select with ngModel
  s("a-select", {
    t('<select [(ngModel)]="'),
    i(1, "model"),
    t('">'),
    t({ "", '\t<option *ngFor="let ' }),
    i(2, "item"),
    t(" of "),
    i(3, "list"),
    t('" [value]="'),
    i(2),
    t('">{{'),
    i(2),
    t("}}</option>"),
    t({ "", "</select>" }),
  }),

  -- ngStyle
  s("a-ngStyle", {
    t('[ngStyle]="{'),
    i(1, "property"),
    t(": "),
    i(2, "expression"),
    t('}"'),
  }),

  -- ngSwitch
  s("a-ngSwitch", {
    t('<div [ngSwitch]="'),
    i(1, "condition"),
    t('">'),
    t({ "", '\t<div *ngSwitchCase="' }),
    i(2, "case"),
    t('">'),
    i(3, "output"),
    t("</div>"),
    t({ "", "\t<div *ngSwitchDefault>", "" }),
    i(4, "default"),
    t("</div>"),
    t({ "", "</div>" }),
  }),

  -- <pre>{{ model | json }}</pre>
  s("a-prej", {
    t("<pre>{{"),
    i(1, "model"),
    t(" | json}}</pre>"),
  }),

  -- <pre>{{ model | async | json }}</pre>
  s("a-preja", {
    t("<pre>{{"),
    i(1, "model"),
    t(" | async | json}}</pre>"),
  }),

  -- ng-container
  s("a-ng-container", {
    t("<ng-container>"),
    i(0),
    t("</ng-container>"),
  }),

  -- ng-content
  s("a-ng-content", {
    t('<ng-content select="['),
    i(0, "selector"),
    t(']"></ng-content>'),
  }),
}
