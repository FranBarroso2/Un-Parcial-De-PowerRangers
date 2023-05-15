data Persona = UnaPersona{
    habilidades :: [String],
    esBuena :: Bool
}

data PowerRanger = UnPowerRanger{
    color :: String,
    powerHabilidades :: [String],
    nivelDePelea :: Int
}deriving(Show,Eq)

gaston, fran, luca, fede :: Persona
fran = UnaPersona ["Ser vago","No entender nada"] False
luca = UnaPersona ["Programar","Tener buena sintaxis"] True
fede = UnaPersona ["Tener pito grande","Ser Profesor"] True
gaston = UnaPersona ["Hace parciales","No hablar"] False

powerRojo, powerAzul, powerRosa,powerVioleta :: PowerRanger
powerRojo = UnPowerRanger "Rojo" ["Pelea","Contrataque","Fuerza"] 100
powerAzul = UnPowerRanger "Azul" ["Defensa","Curacion"] 30
powerRosa = UnPowerRanger "Rosa" ["Volar","Leer mentes"] 80
powerVioleta = UnPowerRanger "Violeta" ["Telequinesis", "Habla con animales"] 50

listaPowerRangers :: [PowerRanger]
listaPowerRangers = [powerRojo, powerAzul, powerRosa, powerVioleta]

--Punto 2
convertirEnPowerRanger :: String -> Persona -> PowerRanger
convertirEnPowerRanger colorPedido persona = UnPowerRanger colorPedido (transformarHabilidades(habilidades persona)) (calcularNivelDePelea(habilidades persona))

transformarHabilidades :: [String] -> [String]
transformarHabilidades = map ("Super" ++)

calcularNivelDePelea :: [String] -> Int
calcularNivelDePelea habilidades = sum(map length habilidades)
--calcularNivelDePelea = sum.map length

--Punto 3

listaDeColores :: [String]
listaDeColores =["Rojo","Verde","Negro"]

formarEquipoRanger ::[Persona] ->[String] -> [PowerRanger]
formarEquipoRanger personas listaDeColores = zipWith convertirEnPowerRanger listaDeColores (filter esBuena personas)


{-
convertirEnPowerRanger :: Persona -> String -> PowerRanger
convertirEnPowerRanger persona colorPedido = UnPowerRanger colorPedido (agregarHabilidad (habilidad persona) colorPedido) (length(habilidad persona))

encontrarColorDePower :: String -> PowerRanger
encontrarColorDePower colorPedido = head(filter(\powerRanger -> colorPedido == color powerRanger) listaPowerRangers)

agregarHabilidad :: String -> String -> [String]
agregarHabilidad habilidad colorPedido = ("Super" ++ habilidad) : powerHabilidad(encontrarColorDePower colorPedido)
-}