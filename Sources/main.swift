//
//  main.swift
//  Perfect File Handling Example
//
//  Created by Jonathan Guthrie on 2016-09-27.
//	Copyright (C) 2015 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//


import PerfectLib


/*
	This example demonstrates the reading and writing of files in the host file system using PerfectLib.
*/

print("Perfect File Handling Examples")
print("==============================")

// Create a working directory within which we will create, edit, read and delete files
//
// When run from Terminal, this directory will be local to the package directory
// if run as ./.build/debug/Perfect-FileHandling
//
// When run from Xcode, the working directory will be in your derived data dir.
// i.e.:
// ~/Library/Developer/Xcode/DerivedData/Perfect-Examples-gvumtxyqcmvtokfnpvuaohasxmpi/Build/Products/Debug/examples

let workingDir = Dir("./examples")
if !workingDir.exists {
	do {
		try workingDir.create()
		print("Working Directory (\(workingDir.path)) for examples created.")
	} catch {
		print("Could not create Working Directory for examples.")
	}
}

// =====================================================================
// Set the working directory
do {
	try workingDir.setAsWorkingDir()
	print("Working Directory set.")
} catch {
	print("Could not set Working Directory for examples.")
}

// =====================================================================
// Create a file
let thisFile = File("testFile.txt")
try thisFile.open(.readWrite)
defer {
	thisFile.close()
}
try thisFile.write(string: "Hello, World!")
print("Created and written to \(thisFile.realPath):")



// =====================================================================
// Duplicate it
let newFile = try thisFile.copyTo(path: "testFileCopy.txt", overWrite: true)



// =====================================================================
// Edit the file original
var contents = try thisFile.readString()
contents += "\r\nThis file has been changed."
try thisFile.write(string: contents)



print("==============================")



// =====================================================================
// Read and display contents of each
print("Contents of \(thisFile.path):")
try thisFile.open(.readWrite)
defer {
	thisFile.close()
}
let contents1 = try thisFile.readString()
print(contents1)
print("==============================")



print("Contents of \(newFile.path):")
// Note that we have not yet opened newFile, so it cannot be read untile we do
try newFile.open(.readWrite)
defer {
	newFile.close()
}
let contents2 = try newFile.readString()
print(contents2)
print("==============================")



// =====================================================================
// Delete the duplicate
newFile.delete()



// =====================================================================
// List the directory contents
let parent = workingDir.parentDir
do {
	try parent?.setAsWorkingDir()
	print("Working Directory set to parent.")
} catch {
	print("Could not set Working Directory parent.")
}
do {
	try parent?.forEachEntry(closure: {
		n in
		print("File: \(n)")
	})
} catch {
	print(error)
}
print("==============================")



// =====================================================================
// Recursively delete the directory
do {
	try parent?.forEachEntry(closure: {
		n in
		print("Deleting: \(n)")
		var toDelete = File(n)
		toDelete.delete()
	})
} catch {
	print(error)
}



print("Finished")
print("==============================")
