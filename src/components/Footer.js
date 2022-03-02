import React from "react";
import {
  Box,
  Container,
  Row,
  Column,
  FooterLink,
  Heading,
} from "./FooterStyles.js";
  
const Footer = () => {
  return (
    <Box style={{
      bottom:0,
      

    }}>
      <h2 style={{ color: "White", 
                   textAlign: "center", 
                   marginTop: "-50px",
                   padding:10
                    }}>
        Vibegram A Social Media Decentralized platform
      </h2>
      <Container>
        <h5 style={{color:"white",
        textAlign:"center",
        }}>Created By Hemant Kumar
        <br/>Delhi Technological University</h5>
            </Container>
    </Box>
  );
};
export default Footer;