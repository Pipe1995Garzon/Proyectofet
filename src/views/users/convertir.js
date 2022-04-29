class Conversionnumeros {
    constructor() {
        this.unidades = ['cero', 'uno', 'dos', 'tres', 'cuatro', 'cinco',
            'seis', 'siete', 'ocho', 'nueve'
        ];
        this.diezAlDieciseis = ['diez', 'once', 'doce', 'trece', 'catorce', 'quince',
            'dieciseis'
        ];
        this.diez['treinta', 'cuarenta', 'cincuenta', 'sesenta', 'setenta',
            'setenta', 'ochenta', 'noventa'];

        this.numeroMensage = document.getElementById('message');
        this.addListener();
    }

    addListener() {
        let elInput = document.getElementById('numero');
        elInput.addEventListener('keyup', () => {
            console.log('listo')
        });
    }
}