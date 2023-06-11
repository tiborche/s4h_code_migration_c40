CLASS zcl_material_information_C40 DEFINITION
 PUBLIC
 FINAL
 CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_material_art
      IMPORTING
        matnr               TYPE i_product-product
      RETURNING
        VALUE(material_art) TYPE i_product-producttype.
ENDCLASS.
CLASS zcl_material_information_C40 IMPLEMENTATION.
  METHOD get_material_art.
    DATA material TYPE i_product.
    DATA production_date TYPE datn.
    DATA bool_tmp TYPE ABAP_BOOLEAN .

    PRODUCTION_DATE = cl_abap_context_info=>get_system_date( ).
    SELECT SINGLE FROM i_product FIELDS producttype WHERE product = @matnr INTO CORRESPONDING FIELDS OF @material .

    material_art = material-producttype.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

    DATA material_info TYPE REF TO zcl_material_information_C40.
    material_info = NEW zcl_material_information_C40( ).
    DATA(material_art) = material_info->get_material_art( 'RM34' ).
    out->write( material_art ).


  ENDMETHOD.
ENDCLASS.
