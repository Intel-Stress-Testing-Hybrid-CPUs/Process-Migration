import {useEffect, useState} from 'react'

const useScript = url => {
useEffect(() => {
    console.log('useScript')
    const[load, setload] = useState(false);
    const script = document.createElement('script');

    script.src = url
    script.async = true;
    script.addEventListener('load', ()=>setLoaded(true));
    document.body.appendChild(script)

    return () => {
        document.body.removeChild(script);
    }

}, [url])
};

export default useScript;

// Helper function grabbed from https://stackoverflow.com/questions/34424845/adding-script-tag-to-react-jsx