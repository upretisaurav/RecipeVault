//
//  Strings.swift
//  Recipe
//
//  Created by saurav upreti on 2/21/25.
//

struct AppStrings {
    struct Common {
        static let next: String = "Next"
        static let done: String = "Done"
    }
    struct Onboarding {
        static let title: String = "Start Cooking"
        static let subTitle: String = "Let's join our community \n to cook better food!"
        static let btnTitle: String = "Let's Start"
    }

    struct Authentication {
        static let welcome: String = "Welcome!"
        static let welcomeMsg: String = "Welcome Back!"
        static let pleaseEnterYourAccountHere: String = "Please enter your account here"
        static let email: String = "Email Address"
        static let password: String = "Password"
        static let forgotPassword: String = "Forgot Password?"
        static let orContinueWith: String = "Or continue with"
        static let doNotHaveAccount: String = "Didn't have an account?"
        static let signUp: String = "Sign Up"
        static let signIn: String = "Sign In"
        static let yourPasswordMustContain: String = "Your password must contain:"
        static let atLeastSixCharacters: String = "Atleast 6 characters"
        static let containsANumber: String = "Contains a number"
        static let passwordRecovery: String = "Password recovery"
        static let enterYourEmailToRecoverPassword: String = "Enter your email to recover your password"
        static let resetYourPassword: String = "Reset your password"
        static let pleaseEnterYourNewPassword: String = "Please enter your new password"
        static let done: String = "Done"
        static let verify: String = "Verify"
        static let sendAgain: String = "Send again"
        static let codeExpiresIn: String = "code expires in: "
        static let checkYourEmail: String = "Check your email"
        static let sentTheCodeToYourEmail: String = "We've sent the code to your email"
        static let accountCreated: String = "Account created!"
        static let goBack: String = "Go Back"
    }

    struct Home {
        static let search: String = "Search"
        static let category: String = "Category"
        static let noFavYet: String = "No favorites yet"
        static let addFavByTappingHeartIcon: String = "Add recipes to your favorites by tapping the heart icon"
        static let addAFilter = "Add a Filter"
        static let cookingDuration = "Cooking Duration"
        static let inMinutes = "(in minutes)"
    }

    struct Search {
        static let calumLewis: String =  "Calum Lewis"
        static let salad: String = "Salad"
        static let searchSuggetions: String = "Search Suggestions"
        static let sushi: String =  "sushi"
        static let sandwich: String = "sandwich"
        static let seafood: String = "seafood"
        static let friedRice: String = "fried rice"
    }

    struct Upload {
        static let cancel: String = "Cancel"
        static let addCoverPhoto: String = "Add Cover Photo"
        static let uptoTwelveMb: String = "(up to 12 Mb)"
        static let foodName: String = "Food Name"
        static let enterFoodName: String = "Enter food name"
        static let description: String = "Description"
        static let enterDescription: String = "Enter description"
        static let tellALittleAboutFood: String = "Tell a little about food"
        static let ingredients: String = "Ingredients"
        static let enterIngredients: String = "Enter ingredient"
        static let addIngredients: String = "+ Ingredient"
        static let note: String = "Note"
        static let uploadSuccess: String = "Upload Success"
        static let yourRecipeHasBeenUploaded: String = "Your recipe has been uploaded, you can see it on your profile."
        static let backToHome: String = "Back to Home"
        static let missingInformation: String = "Missing Information"
        static let myCookbooks: String = "My Cookbooks"
        static let noRecipeYet: String = "No Recipes Yet"
        static let tapToAddRecipe: String = "Tap the '+' button to add your first recipe!"
    }

    struct BottomSheetContent {
        static let chooseOption: String = "Choose one option"
        static let food: String = "Food"
        static let Ingredient: String = "Ingredient"
    }


}
