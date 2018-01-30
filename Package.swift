// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
//  Package.swift
//  Perfect File Handling Example
//
//  Created by Jonathan Guthrie on 2016-09-26.
//	Updated by Rockford Wei on 2018-01-30
//	Copyright (C) 2018 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2018 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//
import PackageDescription

let package = Package(
    name: "Perfect-FileHandling",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/PerfectlySoft/Perfect.git", from: "3.0.0"),
    ],
    targets: [
        .target(
            name: "Perfect-FileHandling",
            dependencies: ["PerfectLib"]),
    ]
)