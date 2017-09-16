<?php
defined('BASEPATH') OR exit('No direct script access allowed');

    $this->load->view('install/commons/header_install');
?>
        
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header bg-primary">
                                    <h4 class="modal-title"><?php echo $header;?></h4>
                                </div>
                                <div class="modal-body">
                                    <p align="center"><?php echo $body;?></p>
                                </div>
                                <div class="modal-footer">
                                    <a href="<?php echo $href ?>"><button type="button" class="btn btn-warning" data-dismiss="modal"><?php echo $btn;?></button></a>
                                    <?php if(isset($reenviar)){echo $reenviar;}?>
                                </div>
                            </div>
                </div>
            </div>
        </div>