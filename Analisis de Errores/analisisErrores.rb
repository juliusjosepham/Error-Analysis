#Lunes 30-04-2018.
#Código fuente del método de análisis de errores.

#Se hace uso de las siguientes fórmulas:

def error_verdadero (vv, aproximacion)	#fórmula de error verdadero
	vv - aproximacion
end

def error_relativo (vv, aproximacion)	#fórmula de error relativo
	ev = error_verdadero(vv, aproximacion)
	ev / vv
end

def error_relativo_porcentual (vv, aproximacion) #error relativo porcentual
	ev = error_verdadero(vv, aproximacion)
	(ev / vv) * 100	
end

def error_aproximado_porcentual (aproximacion_actual, aproximacion_anterior) 	#error aproximado porcentual
	( (aproximacion_actual - aproximacion_anterior) / aproximacion_actual ) * 100
end
#----------------------------------------------------------------------------------------------------------------------------------------------

valor_verdadero = 1.648721271

puts "numero	 |      aproximacion      |      er% (%)        |      ea% (%)"

#------------------------------------------------------------------------------------------------------------------------------------------------
aproximaciones = [1, 1.5, 1.625, 1.645833333, 1.6484375, 1.648697917] #Aproximaciones obtenidas en clase.

aproximaciones.each_with_index do |aproximacion,numero| #Para cada uno de los elementos(aprox) del arreglo llamado 'aproximaciones', así como sus indices (numero), hacer:
	aproximacion_anterior = aproximaciones[numero - 1] 	#Esto es para usarse en la fórmula de error absoluto porcentual
	
	if numero == 0									#Y mostrar según sea el caso:
		puts "#{numero}        |          #{aproximacion}     |            #{error_relativo_porcentual valor_verdadero, aproximacion}    |            No aplica" #Al no haber aproximacion anterior, el EA% no aplica.
	else                                            #Sino, si hay aproximacion anterior, realizar los cálculos.
		puts "#{numero}        |          #{aproximacion}     |            #{error_relativo_porcentual valor_verdadero, aproximacion}    |            #{error_aproximado_porcentual aproximacion,aproximacion_anterior}" #Y lo muestra.
	end
end