.global main

// Entrée: lit trois entiers positifs de 64 bits: a, b, c
// Sortie: "valide"   si a ≤ b ≤ c et a² + b² = c²
//         "invalide" sinon
// Usage des registres:
//   x19 -- a  ...
main:
    // Lire a                       //
    adr   x0, fmtEntree             //
    adr   x1, nombre                //
    bl    scanf                     // scanf(&fmtEntree, &nombre)
    ldr   x19, nombre               // a = nombre
    

    // Lire b
    adr   x0, fmtEntree             
    adr   x1, nombre                
    bl    scanf                     
    ldr   x20, nombre // b = nombre

    // Lire c
    adr   x0, fmtEntree            
    adr   x1, nombre               
    bl    scanf                    
    ldr   x20, nombre // c = nombre

    // Vérifier triplet (a, b, c)
    // et afficher résultat
aSmallerB:
    cmp x19, x20
    b.hs invalide // regarder que n'est pas 

checkSquare:
    mul x19, x19, x19
    mul x20, x20, x20
    mul x21, x21, x21
    add x19, x19, x20
    cmp x19, x21
    b.ne invalide

valide: 
    adr x0, fmtString
    adr x1, msgValide
    bl printf
invalide:
    adr x0, fmtString
    adr x1, msgInvalide
    bl printf

    // Quitter
    mov   x0, 0                     //
    bl    exit                      //

.section ".bss"
                .align  8
nombre:         .skip   8

.section ".rodata"
fmtEntree:      .asciz  "%lu"
fmtString:         .asciz "%s"
msgValide:      .asciz  "valide\n"
msgInvalide:    .asciz  "invalide\n"
