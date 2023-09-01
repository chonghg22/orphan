package kr.co.orphan.common;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.xssf.usermodel.*;

import java.util.Map;

public class POIUtil {
    //    초록바탕에 흰색 글씨
    public static XSSFCellStyle setHeaderStyleXSSF(XSSFFont headerFont, XSSFCellStyle headerStyle)
    {

        headerFont.setFontHeightInPoints((short)10);
        headerFont.setFontName("Arial");
        headerFont.setColor(new XSSFColor(new java.awt.Color(255, 255, 255)));
        headerFont.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
        headerStyle.setFillForegroundColor(new XSSFColor(new java.awt.Color(60, 179, 113)));
        headerStyle.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
        headerStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER);
        headerStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
        headerStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
        headerStyle.setBottomBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        headerStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
        headerStyle.setLeftBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        headerStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
        headerStyle.setRightBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        headerStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
        headerStyle.setTopBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        headerStyle.setFont(headerFont);
        headerStyle.setWrapText(true);

        headerStyle.setBorderRight((short)1);
        headerStyle.setBorderTop((short)1);
        headerStyle.setBorderLeft((short)1);
        headerStyle.setBorderBottom((short)1);

        return headerStyle;
    }


    // 초록바탕에 흰색 글씨
    public static HSSFCellStyle setHeaderStyle(HSSFFont headerFont, HSSFCellStyle headerStyle)
    {

        headerFont.setFontHeightInPoints((short)10);
        headerFont.setFontName("Arial");
        headerFont.setColor(HSSFColor.WHITE.index);
        headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);

        headerStyle.setFillForegroundColor(HSSFColor.SEA_GREEN.index);
        headerStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        headerStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        headerStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

        headerStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        headerStyle.setBottomBorderColor(HSSFColor.BLACK.index);
        headerStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        headerStyle.setLeftBorderColor(HSSFColor.BLACK.index);
        headerStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
        headerStyle.setRightBorderColor(HSSFColor.BLACK.index);
        headerStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
        headerStyle.setTopBorderColor(HSSFColor.BLACK.index);
        headerStyle.setFont(headerFont);

        return headerStyle;
    }


    // 수정 안되는 cell 회색으로
    public static XSSFCellStyle setGrayCellStyleXSSF(XSSFFont cellFont, XSSFCellStyle cellStyle)
    {
        cellFont.setFontHeightInPoints((short)10);
        cellFont.setFontName("Arial");

        cellStyle.setFillForegroundColor(new XSSFColor(new java.awt.Color(204, 204, 204)));
        cellStyle.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
        cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
        cellStyle.setBottomBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
        cellStyle.setLeftBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
        cellStyle.setRightBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
        cellStyle.setTopBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        cellStyle.setFont(cellFont);

        return cellStyle;
    }

    public static XSSFCellStyle setYellowCellStyleXSSF(XSSFFont cellFont, XSSFCellStyle cellStyle)
    {
        cellFont.setFontHeightInPoints((short)10);
        cellFont.setFontName("Arial");

        cellStyle.setFillForegroundColor(HSSFColor.YELLOW.index);
        cellStyle.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
        cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
        cellStyle.setBottomBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
        cellStyle.setLeftBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
        cellStyle.setRightBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
        cellStyle.setTopBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        cellStyle.setFont(cellFont);

        return cellStyle;
    }

    public static XSSFCellStyle setRedCellStyleXSSF(XSSFFont cellFont, XSSFCellStyle cellStyle)
    {
        cellFont.setFontHeightInPoints((short)10);
        cellFont.setFontName("Arial");

        cellStyle.setFillForegroundColor(new XSSFColor(new java.awt.Color(255, 0, 0)));
        cellStyle.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
        cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
        cellStyle.setBottomBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
        cellStyle.setLeftBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
        cellStyle.setRightBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
        cellStyle.setTopBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        cellStyle.setFont(cellFont);

        return cellStyle;
    }


    // 수정 안되는 cell 회색으로
    public static HSSFCellStyle setGrayCellStyle(HSSFFont cellFont, HSSFCellStyle cellStyle)
    {
        cellFont.setFontHeightInPoints((short)10);
        cellFont.setFontName("Arial");

        cellStyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
        cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        cellStyle.setBottomBorderColor(HSSFColor.BLACK.index);
        cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        cellStyle.setLeftBorderColor(HSSFColor.BLACK.index);
        cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
        cellStyle.setRightBorderColor(HSSFColor.BLACK.index);
        cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
        cellStyle.setTopBorderColor(HSSFColor.BLACK.index);
        cellStyle.setFont(cellFont);

        return cellStyle;
    }

    // 일반 cell
    public static XSSFCellStyle setWhiteCellStyleXSSF(XSSFFont cellFont, XSSFCellStyle cellStyle)
    {
        cellFont.setFontHeightInPoints((short)10);
        cellFont.setFontName("Arial");

        cellStyle.setFillForegroundColor(new XSSFColor(new java.awt.Color(255, 255, 255)));
        cellStyle.setFillPattern(XSSFCellStyle.SOLID_FOREGROUND);
        cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
        cellStyle.setBottomBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
        cellStyle.setLeftBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
        cellStyle.setRightBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
        cellStyle.setTopBorderColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
        cellStyle.setWrapText(true);
        cellStyle.setFont(cellFont);
        cellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_TOP);

        return cellStyle;
    }

    // 빈 cell
    public static XSSFCellStyle setEmptyCellStyleXSSF(XSSFFont cellFont, XSSFCellStyle cellStyle)
    {
        cellFont.setFontHeightInPoints((short)10);
        cellFont.setFontName("Arial");
        cellStyle.setFont(cellFont);

        return cellStyle;
    }

    // 일반 cell
    public static HSSFCellStyle setWhiteCellStyle(HSSFFont cellFont, HSSFCellStyle cellStyle)
    {
        cellFont.setFontHeightInPoints((short)10);
        cellFont.setFontName("Arial");

        cellStyle.setFillForegroundColor(HSSFColor.WHITE.index);
        cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        cellStyle.setBottomBorderColor(HSSFColor.BLACK.index);
        cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        cellStyle.setLeftBorderColor(HSSFColor.BLACK.index);
        cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
        cellStyle.setRightBorderColor(HSSFColor.BLACK.index);
        cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
        cellStyle.setTopBorderColor(HSSFColor.BLACK.index);
        cellStyle.setWrapText(true);
        cellStyle.setFont(cellFont);

        return cellStyle;
    }

    public static void setStyleCellXSSF(XSSFRow row, XSSFCell cell, XSSFCellStyle cellStyle, int col, String colvalue ) {
        cell = row.createCell((short) col);
        cell.setCellStyle(cellStyle);
        cell.setCellValue(colvalue);
    }

    public static void setStyleCellXSSF(XSSFRow row, XSSFCell cell, XSSFCellStyle cellStyle, int col, int colvalue ) {
        cell = row.createCell((short) col);
        cell.setCellStyle(cellStyle);
        cell.setCellValue(colvalue);
    }

    public static void setStyleCell(HSSFRow row, HSSFCell cell, HSSFCellStyle cellStyle, int col, String colvalue ) {
        cell = row.createCell((short) col);
        cell.setCellStyle(cellStyle);
        //cell.setEncoding(HSSFCell.ENCODING_UTF_16);
        cell.setCellValue(colvalue);
    }

    public static void setCellXSSF(XSSFRow row, XSSFCell cell, int col, Map<String, Object> listmap, String colvalue ) {
        cell = row.createCell((short) col);
        cell.setCellValue(colvalue);
    }


    public static void setCell(HSSFRow row, HSSFCell cell, int col, Map<String, Object> listmap, String colvalue ) {
        cell = row.createCell((short) col);
        //cell.setEncoding(HSSFCell.ENCODING_UTF_16);
        cell.setCellValue(colvalue);
    }
}
