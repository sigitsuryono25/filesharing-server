const express = require('express');

function createRouterUser(db) {
    const router = express.Router();

    router.post('/auth/user/register', (req, res, next) => {
        console.log(req.body);
        db.query("INSERT INTO tb_user(userid, nama_lengkap, password, email, tipe_akun, fcm_token) VALUES(?,?,md5(?),?,?,?)",
            [req.body.userid, req.body.nama_lengkap, req.body.password, req.body.email, req.body.tipe, req.body.fcm],
            (error) => {
                console.error(error);
                if (error) {
                    res.status(500).json({
                        status: 'error'
                    });
                } else {
                    res.status(200).json({
                        status: 'OK',
                        message: 'Pendaftaran Berhasil'
                    });
                }
            });
    });

    router.post("/auth/user/login", (req, res, next) => {
        db.query("SELECT userid, nama_lengkap, email, foto, tipe_akun, fcm_token FROM tb_user WHERE userid = ? AND password = md5(?)",
            [req.body.userid, req.body.password],
            (error, results) => {
                if (error) {
                    res.status(404).json({
                        status: 'not found'
                    });
                } else {
                    res.status(200).json(results);
                }
            });
    });

    router.put("/auth/user/close-account", (req, res, next) => {
        db.query("UPDATE tb_user SET tutup_account = ? WHERE userid = ?",
            [req.body.tutup, req.body.userid],
            (error) => {
                if (error) {
                    res.status(500).json({
                        status: 'error'
                    });
                } else {
                    res.status(200).json({
                        status: 'OK'
                    });
                }
            });
    });

    return router;
}
module.exports = createRouterUser;