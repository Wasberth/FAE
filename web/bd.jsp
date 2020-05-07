<%--
CREATE TABLE `musuario` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `user_tag` varchar(30) NOT NULL,
  `user_password` varchar(30) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_appat` varchar(30) NOT NULL,
  `user_apmat` varchar(30) NOT NULL,
  `user_level` int(11) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `user_tag` (`user_tag`)
);

CREATE TABLE `EHistorial` (
  `id_hist` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_pub` int(11) NOT NULL,
  PRIMARY KEY (`id_hist`),
  FOREIGN KEY (`id_user`) REFERENCES musuario(`id_user`),
  FOREIGN KEY (`id_pub`) REFERENCES MPublicaciones(`id_pub`)
  
);

CREATE TABLE `MPublicaciones` (
  `id_pub` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_pub` VARCHAR(50) NOT NULL,
  `cuerpo_pub` TEXT(125) NOT NULL,
  `anonim_pub` BOOL NOT NULL,
  `fecha_pub` TEXT(125) NOT NULL,
  `id_eti` VARCHAR(50) NOT NULL,
  `id_nivp` INT(1) NOT NULL,
  PRIMARY KEY (`id_pub`)
);
--%>