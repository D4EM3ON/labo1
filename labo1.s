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
    bl scanf
    ldr x20, nombre // b = nombre

    // Lire c
    bl scanf
    ldr x21, nombre // c = nombre

    // Vérifier triplet (a, b, c)
    // et afficher résultat
    /*  
        code ici  
                  */
valide: 
    mov x0, msgValide
    bl printf
invalide:
    ret "invalide"

    // Quitter
    mov   x0, 0                     //
    bl    exit                      //

.section ".bss"
                .align  8
nombre:         .skip   8

.section ".rodata"
fmtEntree:      .asciz  "%lu"
msgValide:      .asciz  "valide\n"
msgInvalide:    .asciz  "invalide\n"
