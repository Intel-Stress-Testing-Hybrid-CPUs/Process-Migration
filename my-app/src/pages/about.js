import React from "react";

const About = () => {
    return (
        <body>
        <div
            /*style={{
                //display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
                height: '100vh'
            }}*/
        >
            <h2>Team I3 "Intel Hybrid CPU"</h2>
            <p>Our testing suite is designed to target two main areas of potential issues in a hybrid system: process migration and saving / restoring memory images. The system has been broken down into components for testing these areas, as well as collecting and logging data from the tests, checking the logs for expectations, and providing a GUI for easy interaction. The user should be able to launch the GUI, view all available tests, tweak any parameters, launch the test, and view the results.</p>
        </div>
        </body>
    );
};

export default About;
