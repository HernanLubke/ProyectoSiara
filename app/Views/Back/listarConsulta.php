<?php
// Cargar el navbar
echo view('front/navbar2');
?>


<?php $titulo = "ListaConsulta"; ?>


<?php if (session()->getFlashdata('success')): ?>
    <div class="alert alert-success text-center">
        <?= session()->getFlashdata('success') ?>
    </div>
<?php endif; ?>
<!-- Tabla de mensajes no leídos -->
<div class="container">

    <div class="table-responsive">
        <table class="table table-light text-center">
            <thead class="thead-light">
                <tr>
                    <th>#ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Email</th>
                    <th>Asunto</th>
                    <th>Mensaje</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($usuarios as $usuario): ?>
                    <?php if ($usuario['visto'] !== 'si'): ?>
                        <tr>
                            <td>
                                <?= $usuario['usuario_id']; ?>
                            </td>
                            <td>
                                <?= $usuario['usuario']['Nombre']; ?>
                            </td>
                            <td>
                                <?= $usuario['usuario']['Apellido']; ?>
                            </td>
                            <td>
                                <?= $usuario['usuario']['Email']; ?>
                            </td>
                            <td>
                                <?= $usuario['asunto']; ?>
                            </td>
                            <td>
                                <?= $usuario['mensaje']; ?>
                            </td>
                            <td>
                                <a href="<?= site_url('Usuario_controller/leidoConsulta/' . $usuario['id']) ?>" class="btn btn-primary"
                                    type="button">Marcar como leído</a>
                            </td>
                        </tr>
                    <?php endif; ?>
                <?php endforeach; ?>
            </tbody>
        </table>

    </div>

    <h3 class="text-center pb-4 pt-4">¡Mensajes ya leídos!</h3>
    <div class="row">
        <div class="table-responsive">
            <table class="table table-secondary text-center">
                <thead class="thead-light">
                    <tr>
                        <th>#ID</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Email</th>
                        <th>Asunto</th>
                        <th>Mensaje</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($usuarios as $usuario): ?>
                        <?php if ($usuario['visto'] === 'si'): ?>
                            <tr>
                                <td>
                                    <?= $usuario['usuario_id']; ?>
                                </td>
                                <td>
                                    <?= $usuario['usuario']['Nombre']; ?>
                                </td>
                                <td>
                                    <?= $usuario['usuario']['Apellido']; ?>
                                </td>
                                <td>
                                    <?= $usuario['usuario']['Email']; ?>
                                </td>
                                <td>
                                    <?= $usuario['asunto']; ?>
                                </td>
                                <td>
                                    <?= $usuario['mensaje']; ?>
                                </td>
                            </tr>
                        <?php endif; ?>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

</section>