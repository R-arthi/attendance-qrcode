<%@ page import="java.io.*, java.awt.image.BufferedImage, javax.imageio.ImageIO, com.google.zxing.*, com.google.zxing.qrcode.QRCodeWriter, com.google.zxing.qrcode.decoder.ErrorCorrectionLevel, com.google.zxing.common.BitMatrix, com.google.zxing.client.j2se.MatrixToImageWriter" %>
<%@ page contentType="image/png" language="java" %>
<%
    String data = request.getParameter("data");

    if (data != null && !data.isEmpty()) {
        try {
            // Set QR code parameters
            int width = 300;
            int height = 300;
            // Set error correction level
            ErrorCorrectionLevel errorCorrectionLevel = ErrorCorrectionLevel.L; // You can adjust the error correction level as needed

            // Generate QR code matrix
            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            BitMatrix bitMatrix = qrCodeWriter.encode(data, BarcodeFormat.QR_CODE, width, height);
            // Convert BitMatrix to BufferedImage
            BufferedImage image = MatrixToImageWriter.toBufferedImage(bitMatrix);
            // Write the image to the response output stream
            ImageIO.write(image, "png", response.getOutputStream());
        } catch (Exception e) {
        	
            response.getWriter().println("Error generating QR Code: " + e.getMessage());
            e.printStackTrace(response.getWriter());
        }
    } else {
        response.getWriter().println("Error: Data to encode is empty!");
    }
%>