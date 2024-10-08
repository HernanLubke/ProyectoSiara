<?php $titulo = "Mis Compras"; ?>
<div class="container mb-4" style="background-color:rgba(240, 229, 74, 0.795); padding: 20px; border-radius: 8px;">
    <h1 class="mt-4 text-center titulo">Mis Compras</h1>


    <style>
        body {
            background-color: rgba(240, 229, 74, 0.795); 
        }
       

    </style>



    <?php if (empty($compras)): ?>
        <table class="table table-light">
            <tbody>
                <tr>
                    <td class="text-center">No se encontraron compras</td>
                </tr>
            </tbody>
        </table>
    <?php else: ?>
        <div class="accordion" id="comprasAccordion">
            <?php foreach ($compras as $compra): ?>
                <div class="accordion-item" style="background-color: white; border-radius: 4px; margin-bottom: 10px;">
                    <h2 class="accordion-header" id="heading<?= $compra['id'] ?>">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapse<?= $compra['id'] ?>" aria-expanded="false"
                            aria-controls="collapse<?= $compra['id'] ?>">
                            Número de Factura: <?= $compra['id'] ?>
                        </button>
                    </h2>
                    <div id="collapse<?= $compra['id'] ?>" class="accordion-collapse collapse"
                        aria-labelledby="heading<?= $compra['id'] ?>" data-bs-parent="#comprasAccordion">
                        <div class="accordion-body" style="background-color: #f1f1f1;">
                            <p><strong>Usuario:</strong> <?= $usuarios[$compra['id']] ?></p>
                            <p><strong>Importe Total:</strong> $<?= $compra['importe_total'] ?></p>
                            <p><strong>Fecha de compra:</strong> <?= date('Y-m-d', strtotime($compra['fecha'])) ?></p>

                            <!--  tabla de detalles -->
                            <table class="table">
                                <h4 class="text-center">Detalles de la factura</h4>
                                <thead>
                                    <tr>
                                        <th>Producto</th>
                                        <th>Cantidad</th>
                                        <th>Precio Unitario</th>
                                        <th>Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($detalles[$compra['id']] as $detalle): ?>
                                        <tr>
                                            <td><?= $detalle['producto']->nombre ?></td>
                                            <td><?= $detalle['cantidad'] ?></td>
                                            <td>$<?= $detalle['producto']->precio ?></td>
                                            <td>$<?= $detalle['subtotal'] ?></td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
</div>
