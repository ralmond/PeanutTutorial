list(health = list(parents = logical(0), pos = c(x = 942, y = 462
), title = "Health-State"), thal = list(parents = "health", pos = c(x = 678, 
y = 282), title = "Exer-Thal-Defects"), restecg = list(parents = "health", 
    pos = c(x = 1122, y = 288), title = "Rest-Ecg"), fbs = list(
    parents = "health", pos = c(x = 1380, y = 306), title = "Fast-Bsug"), 
    ca = list(parents = "health", pos = c(x = 1458, y = 426), 
        title = "Colored-Floro"), thalach = list(parents = "health", 
        pos = c(x = 942, y = 660), title = "Max-Heart-Rate"), 
    slope = list(parents = c("health", "thalach"), pos = c(x = 1272, 
    y = 636), title = "Slope-Peak"), CP = list(parents = "health", 
        pos = c(x = 624, y = 462), title = "Chest-Pain"), healthy = list(
        parents = "health", pos = c(x = 306, y = 282), title = "Healthy?"), 
    oldpeak = list(parents = c("health", "slope"), pos = c(x = 1458, 
    y = 552), title = "Old-Peak"), Age = list(parents = c("thalach", 
    "health"), pos = c(x = 618, y = 606), title = ""), Sex = list(
        parents = "thal", pos = c(x = 870, y = 150), title = ""), 
    chol = list(parents = "restecg", pos = c(x = 1362, y = 144
    ), title = "Chol"), exang = list(parents = "CP", pos = c(x = 354, 
    y = 534), title = "Exer-Angina"), trestbps = list(parents = "Age", 
        pos = c(x = 372, y = 726), title = "Rest-BP"))
