struct Meal: Codable {
    let meal: [Meals]
}

struct Meals: Codable {
    let strMeal: String?
    let strMealThumb: String?
    let idMeal: String?
}
