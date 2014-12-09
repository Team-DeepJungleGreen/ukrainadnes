<?php

/**
 * PHP REST SQL XML renderer class
 * This class renders the REST response data as JSON.
 */
class PHPRestSQLRenderer {
   
    /**
     * @var PHPRestSQL PHPRestSQL
     */
    var $PHPRestSQL;
   
    /**
     * Constructor.
     * @param PHPRestSQL PHPRestSQL
     */
    function render($PHPRestSQL) {
        $this->PHPRestSQL = $PHPRestSQL;
        switch($PHPRestSQL->display) {
            case 'database':
                $this->database();
                break;
            case 'table':
                $this->table();
                break;
            case 'row':
                $this->row();
                break;
        }
    }
    
    /**
     * Output the top level table listing.
     */
    function database() {
        header('Content-Type: text/xml');
        echo '<?xml version="1.0" encoding="UTF-8"?>'."\n";
        echo '<database xmlns:xlink="http://www.w3.org/1999/xlink">'."\n";
        if (isset($this->PHPRestSQL->output['database'])) {
            foreach ($this->PHPRestSQL->output['database'] as $table) {
                echo "\t".'<table xlink:href="'.htmlspecialchars($table['xlink']).'">'.htmlspecialchars($table['value']).'</table>'."\n";
            }
        }
        echo '</database>';
    }
    
    /**
     * Output the rows within a table.
     */
    function table() {
        header('Content-Type: application/json');
        $jsonTable = '{ "results":[';
        if (isset($this->PHPRestSQL->output['table'])) {
            foreach ($this->PHPRestSQL->output['table'] as $row) {
                $jsonRow = "{";

                foreach ($row['data'] as $fieldElement) {
                    $fieldName = $fieldElement['field'];
                    $jsonRow .= '"'. htmlspecialchars($fieldName) . '":"' .
                        htmlspecialchars($fieldElement['value']) . '",';
                }

                $jsonRow = rtrim($jsonRow, ",");
                $jsonRow .= "},";
                $jsonTable .= $jsonRow;
            }
        }
        $jsonTable = rtrim($jsonTable, ",");
        $jsonTable .= "]}";
        echo $jsonTable;
    }
    
    /**
     * Output the entry in a table row.
     */
    function row() {
        header('Content-Type: text/json');
        if (isset($this->PHPRestSQL->output['row'])) {
            $jsonRow = "{";
            foreach ($this->PHPRestSQL->output['row'] as $fieldElement) {
                $fieldName = $fieldElement['field'];
                $jsonRow .= '"'. htmlspecialchars($fieldName) . '":"' .
                    htmlspecialchars($fieldElement['value']) . '",';
            }
            $jsonRow = rtrim($jsonRow, ",");
            $jsonRow .= "}";

            echo $jsonRow;
        }
    }

}