import Foundation
//
//  Microwave.swift
//
//  Created by Ioana Marinescu
//  Created on 2024/03/01
//  Version 1.0
//  Copyright (c) 2024 Ioana Marinescu. All rights reserved.
//
//  A program that calculates how long a food 
//  needs to be heated up in the microwave.

// creates custom errors
enum InputError: Error {
  // invalid input error
  case invalidInput
}

// function to get user input that returns a float
func userInput() throws -> Float {
  // gets user input for the amount
  print("How many are you heating up? (1-3)")
  guard let input = readLine(), let amount = Float(input) else {
    throw InputError.invalidInput
  }
  return amount
}

// function calculates the minutes and seconds
func minutesSecondsCalculation(time: Double) throws -> String {
  // calculations for minutes and seconds
  let minutes = Int(time)
  let seconds = Int(time * 60 - (Double(minutes) * 60))
  // return display message
  return "It will take \(minutes) minute(s) and \(seconds) second(s)."
}

do {
  // variable declaration
  var baseTime: Double = 0
  var totalTime: Double = 0

  // get user input for food
  print("What would you like to heat up? (sub, pizza, soup)")
  guard let userFood = readLine() else {
      throw InputError.invalidInput
  }

  // calls function to get user input for amount and 'tries' it
  let userAmount = try userInput()

  // if statement calculating the time based on food
  if userFood == "sub" {
    // time for 1 item to heat
    baseTime = 1
    // if one item -> base time to heat
    if userAmount == 1 {
      totalTime = baseTime
      print(try minutesSecondsCalculation(time: totalTime))

      // if two items -> base time + 50% longer
    } else if userAmount == 2 {
      totalTime = baseTime * 1.5
      print(try minutesSecondsCalculation(time: totalTime))

      // if three items -> base time + 100% longer
    } else if userAmount == 3 {
      totalTime = baseTime * 2
      print(try minutesSecondsCalculation(time: totalTime))
    } else {
      totalTime = 1
      print("That is not a valid amount of food to put in the microwave!")
    }

    // if statement calculating the time based on food
  } else if userFood == "pizza" {
    // time for 1 item to heat
    baseTime = 0.75
    // if one item -> base time to heat
    if userAmount == 1 {
      totalTime = baseTime
      print(try minutesSecondsCalculation(time: totalTime))

      // if two items -> base time + 50% longer
    } else if userAmount == 2 {
      totalTime = baseTime * 1.5
      print(try minutesSecondsCalculation(time: totalTime))

      // if three items -> base time + 100% longer
    } else if userAmount == 3 {
      totalTime = baseTime * 2
      print(try minutesSecondsCalculation(time: totalTime))

    } else {
      print("That is not a valid amount of food to put in the microwave!")
    }

  // if statement calculating the time based on food
  } else if userFood == "soup" {
    // time for 1 item to heat
    baseTime = 1
    // if one item -> base time to heat
    if userAmount == 1 {
      totalTime = baseTime
      print(try minutesSecondsCalculation(time: totalTime))

      // if two items -> base time + 50% longer
    } else if userAmount == 2 {
      totalTime = baseTime * 1.5
      print(try minutesSecondsCalculation(time: totalTime))

      // if three items -> base time + 100% longer
    } else if userAmount == 3 {
      totalTime = baseTime * 2
      print(try minutesSecondsCalculation(time: totalTime))

    } else {
      print("That is not a valid amount of food to put in the microwave!")
    }
  } else {
    print("Please enter either sub, pizza, or soup. No other input is valid.")
  }

  // if user imputed invalid input
} catch InputError.invalidInput {
  print("Invalid input, please enter one of the three options.")

  // any other invalid input
} catch {
  print("Invalid input, please enter one of the three options.")
}
