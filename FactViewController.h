//
//  FactViewController.h
//  DatosCuriososApp
//
//  Created by Dan Vaz on 17/10/25.
//
#import <UIKit/UIKit.h>

@interface FactViewController : UIViewController

// AÑADE ESTA PROPIEDAD:
// Esta propiedad crea el método setCategoriaSeleccionada: que necesitas.
@property (nonatomic, strong) NSString *categoriaSeleccionada;

// AÑADE TAMBIÉN LAS PROPIEDADES DE LÓGICA Y UI PARA EVITAR FUTUROS ERRORES:
@property (nonatomic, strong) NSDictionary *datos;
@property (nonatomic, assign) NSInteger indiceActual;

@property (nonatomic, strong) UILabel *categoriaActualLabel;
@property (nonatomic, strong) UILabel *datoCuriosoLabel;

@end
