### Este es un código ejemplo de clase

# 1. Carga del dataset y preparación de las variables

data("mtcars")
head(mtcars)

# Variable objetivo: `am` (0 = automático, 1 = manual)
# Variables predictoras: `mpg` (millas por galón), `hp` (caballos de fuerza), `wt` (peso en miles de libras)

# 2. Análisis inicial de las variables

pairs(mtcars[, c("mpg", "hp", "wt", "am")], main = "Scatterplot matrix")
cor(mtcars[, c("mpg", "hp", "wt")]) # correlación entre variables predictoras

# 3. Definición del modelo logístico

modelo_logistico <- glm(am ~ mpg + hp + wt, data = mtcars, family = binomial) # modelo de regresión logística
summary_modelo <- summary(modelo_logistico)

# 4. Resultados del modelo y análisis

y_pred <- predict(modelo_logistico, type = "response") # probabilidades predichas

# Clasificación de predicciones: convertir probabilidades a clases (umbral 0.5)
y_pred_class <- ifelse(y_pred > 0.5, 1, 0)

# Matriz de confusión
table(Predicted = y_pred_class, Actual = mtcars$am)
